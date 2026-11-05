defmodule Punto3 do
  @moduledoc """
  Simula un retiro en cajero automático para una única cuenta.
  """

  @pin_correcto "0482"
  @saldo_disponible 450_000
  @limite_por_retiro 600_000

  @monto_multiplo 10_000
  @umbral_comision_ahorros 200_000
  @comision_ahorros_baja 0
  @comision_ahorros_alta 2_500
  @comision_corriente 4_000

  @billete_50 50_000
  @billete_20 20_000
  @billete_10 10_000

  def main do
    pin = Util.leer("Ingrese su PIN: ", :string)
    cuenta = Util.leer("Tipo de cuenta (ahorros/corriente): ", :string)
    monto = Util.leer("Monto a retirar: ", :integer)

    procesar(pin, cuenta, monto)
    |> mostrar_resultado()
    |> Util.imprimir_mensaje()
  end

  # ============================================================
  # Encadena las validaciones con with, en el orden exigido,
  # y se detiene en la primera que falle.
  # ============================================================
  defp procesar(pin, cuenta_texto, monto) do
    with {:ok, _pin} <- validar_pin(pin),
         {:ok, cuenta} <- validar_cuenta(cuenta_texto),
         {:ok, monto} <- validar_monto_positivo(monto),
         {:ok, monto} <- validar_multiplo(monto),
         {:ok, monto} <- validar_limite(monto),
         comision <- calcular_comision(cuenta, monto),
         {:ok, monto} <- validar_saldo(monto, comision) do
      saldo_restante = @saldo_disponible - monto - comision
      billetes = calcular_billetes(monto)
      {:ok, {monto, comision, saldo_restante, billetes}}
    else
      {:error, motivo} -> {:error, motivo}
    end
  end

  # ============================================================
  # Validaciones, en el orden pedido por el enunciado
  # ============================================================
  defp validar_pin(pin) when byte_size(pin) != 4 do
    {:error, "El PIN debe tener exactamente 4 caracteres"}
  end

  defp validar_pin(pin) when pin == @pin_correcto, do: {:ok, pin}
  defp validar_pin(_pin), do: {:error, "PIN incorrecto"}

  # Pattern matching para el tipo de cuenta (requisito técnico)
  defp validar_cuenta("ahorros"), do: {:ok, :ahorros}
  defp validar_cuenta("corriente"), do: {:ok, :corriente}
  defp validar_cuenta(_otro), do: {:error, "Tipo de cuenta no válido"}

  defp validar_monto_positivo(monto) when monto > 0, do: {:ok, monto}
  defp validar_monto_positivo(_monto), do: {:error, "El monto debe ser mayor que cero"}

  defp validar_multiplo(monto) when rem(monto, @monto_multiplo) == 0, do: {:ok, monto}
  defp validar_multiplo(_monto), do: {:error, "El monto debe ser múltiplo de $10.000"}

  defp validar_limite(monto) when monto <= @limite_por_retiro, do: {:ok, monto}
  defp validar_limite(_monto), do: {:error, "El monto supera el límite por retiro"}

  defp validar_saldo(monto, comision) when monto + comision <= @saldo_disponible do
    {:ok, monto}
  end

  defp validar_saldo(_monto, _comision) do
    {:error, "El monto más la comisión supera el saldo disponible"}
  end

  # ============================================================
  # Comisión: guards (requisito técnico) + pattern matching en el tipo de cuenta
  # ============================================================
  defp calcular_comision(:ahorros, monto) when monto <= @umbral_comision_ahorros do
    @comision_ahorros_baja
  end

  defp calcular_comision(:ahorros, _monto), do: @comision_ahorros_alta
  defp calcular_comision(:corriente, _monto), do: @comision_corriente

  # ============================================================
  # Entrega de billetes: la menor cantidad posible (greedy con div/rem)
  # ============================================================
  defp calcular_billetes(monto) do
    billetes_50 = div(monto, @billete_50)
    resto_50 = rem(monto, @billete_50)

    billetes_20 = div(resto_50, @billete_20)
    resto_20 = rem(resto_50, @billete_20)

    billetes_10 = div(resto_20, @billete_10)

    {billetes_50, billetes_20, billetes_10}
  end

  # ============================================================
  # Salida: recibe la tupla completa y la desarma en la cabecera
  # ============================================================
  defp mostrar_resultado({:ok, {monto, comision, saldo_restante, {b50, b20, b10}}}) do
    """
    --- Comprobante de retiro ---
    Monto retirado: $#{monto}
    Comisión: $#{comision}
    Saldo restante: $#{saldo_restante}
    Billetes entregados: #{b50} de $50.000, #{b20} de $20.000, #{b10} de $10.000
    """
  end

  defp mostrar_resultado({:error, motivo}), do: "Retiro rechazado: #{motivo}"
end

Punto3.main()
