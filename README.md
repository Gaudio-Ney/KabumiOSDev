# Desafio do processo seletivo da Kabum para desenvolvedor iOS.

![](https://paper-attachments.dropbox.com/s_366F397AD22A53E54D65D81493B2FABBD6F4E86F6D4B14200F33C533DB715A6E_1630766176833_banner_img.jpg)


O desafio: reproduzir a tela de início (Home) do app do KaBuM! atualmente disponível na **App Store (iOS)** ou Google Play (Android).

**Obs.:** Não é necessário desenvolver o banner rotativo do topo, nem o setor de Ofertas. **Desenvolver apenas a listagem de "Produtos em destaque".**

**Informações:** você pode obter a listagem de produtos no seguinte endpoint:
@GET ([https://servicespub.prod.api.aws.grupokabum.com.br/home/v1/home/produto](https://servicespub.prod.api.aws.grupokabum.com.br/home/v1/home/produto)) utilizando os seguintes parâmetros:

- app: Int -> indicação de origem, 
- app = 1 limite: Int -> limite de produtos por página 
- pagina: Int -> offset da página a ser carregada

**Requisitos:**

- Utilizar **Swift (iOS)** ou Kotlin (Android);
- Arquitetura **MVC**;
- Código comentado no que for necessário para entendimento;
- **Infinite Scrolling com paginação de 10 produtos, exibindo indicador de loading ao final da listagem**;
- O código deve possuir **bom desempenho**, sem travamentos.

Entrega: subir o projeto para um repositório do GitHub e enviar o link para o e-mail: [apps@kabum.com.br](mailto:apps@kabum.com.br)

Prazo de entrega de 7 dias a partir do recebimento do teste.

**Prints das telas de referências:**


![](https://paper-attachments.dropbox.com/s_366F397AD22A53E54D65D81493B2FABBD6F4E86F6D4B14200F33C533DB715A6E_1630766260827_KabumHome1.PNG)
![](https://paper-attachments.dropbox.com/s_366F397AD22A53E54D65D81493B2FABBD6F4E86F6D4B14200F33C533DB715A6E_1630766260973_KabumHome2.PNG)
![](https://paper-attachments.dropbox.com/s_366F397AD22A53E54D65D81493B2FABBD6F4E86F6D4B14200F33C533DB715A6E_1630766260881_KabumItem.PNG)
