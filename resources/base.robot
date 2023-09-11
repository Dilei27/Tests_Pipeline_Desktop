*** Settings ***
Documentation        Test Desktop com Alteracao de Planilha

Library          SikuliLibrary
Library          pandas
Resource         actions/experience.robot

*** Keywords ***
Carrega os Elementos do UAU
    Add Image Path    ${EXECDIR}\\resources\\elements

Inicia Sessão
    Carrega os Elementos do UAU

Encerrar Sessão
    Stop Remote Server

Finaliza Teste
    Capture Screen
    



