import pandas as pd
import sys

class AtualizarPlanilha:

    @staticmethod
    def atualizar_planilha(number):
        try:
            # 1. Atualizar a planilha com o valor de NUMBER
            nome_arquivo = 'Planodecontas.xls'
            df = pd.read_excel(nome_arquivo)

            # Trocar os valores da coluna "MASCARA" da linha 2 até a linha 101 pelo valor de NUMBER
            df.loc[0:101, 'MASCARA'] = number

            # 2. Converter a coluna 'MASCARA' de texto para número (caso ela ainda esteja como texto)
            df['MASCARA'] = pd.to_numeric(df['MASCARA'], errors='coerce')

            # 3. Salvar as alterações na planilha
            df.to_excel(nome_arquivo, index=False, engine='openpyxl')

            print("Planilha atualizada com sucesso!")
        except (ValueError, FileNotFoundError) as e:
            print("Erro:", e)

if __name__ == "__main__":
    # Verificar se o número foi fornecido como argumento
    if len(sys.argv) < 2:
        print("Erro: Número não foi fornecido.")
        sys.exit(1)

    try:
        NUMBER = int(sys.argv[1])  # Converter para inteiro
        AtualizarPlanilha.atualizar_planilha(NUMBER)
    except ValueError:
        print("Erro: O valor fornecido não é um número inteiro válido.")
    except Exception as e:
        print("Erro desconhecido:", e)
