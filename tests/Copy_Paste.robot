*** Settings ***
Documentation       Test Desktop com Alteracao de Planilha

Resource            ../resources/base.robot
Library             ../resources/libs/AtualizarPlanilha.py
Library             SikuliLibrary
Library             FakerLibrary        locale=pt_BR

Suite Setup         Inicia Sessão
Suite Teardown      Encerrar Sessão


*** Test Cases ***
Test Desktop 
    ${NUMBER}   FakerLibrary.numerify
    Click    menu_Iniciar.png
    Input Text    input_Text_Buscar.png    Notepad++
    Click    notepad.png    
    Input Text    input_Text_Notepad.png    Vamos Fazer um teste com um numero aleatorio OK !! ${NUMBER}
    Click   fechar.png
    Click   nao_Salvar.png
    Sleep   1
    Click   fechar_Notepad.png

    # Exibe o número no console
    Log To Console    ${NUMBER}

#Atualizar Planilha
        
    # Chamar o script Python para atualizar a planilha com o valor obtido
    AtualizarPlanilha    ${NUMBER}

    # Esperar alguns segundos para garantir que o arquivo Python tenha tempo de atualizar a planilha
    Sleep    5s

    # Lendo a planilha atualizada na pasta Python
    ${updated_df}    Read Excel    Planodecontas.xls
    
    # Exibir o DataFrame com as informações atualizadas
    Log To Console    ${updated_df}

    