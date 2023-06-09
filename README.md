# Projeto de Computação gráfica

## Alunos:
* Igor Freire
* Gabriel Spencer
* Raí Soares
* Rodrigo Cavalcanti
* Talia Flor

Este é um repositório de código para um simples sketch de animação criado usando a linguagem Processing. O sketch exibe uma cena com uma casa, uma pessoa, uma lua, estrelas e um arco-íris. O usuário pode controlar o movimento da pessoa usando as teclas de seta esquerda e direita.

## Recursos

- Céu com cor personalizável
- Grama com cor personalizável
- Lua com cor e efeitos de iluminação personalizáveis
- Estrelas com posição e cor personalizáveis
- Arco-íris com esquema de cores personalizável
- Casa com cores personalizáveis para as paredes, o telhado, a porta e a maçaneta
- Pessoa com cor e cor dos olhos personalizáveis
- Controle interativo de movimento para a pessoa usando as teclas de seta

## Instalação

1. Certifique-se de ter o [Processing](https://processing.org/) instalado em sua máquina.
2. Clone este repositório ou baixe os arquivos do código.
3. Abra o código no Processing.
4. Execute o sketch clicando no botão "Play" ou pressionando Ctrl+R (Cmd+R no Mac).

## Uso

- Use as teclas de seta esquerda e direita para mover a pessoa na cena.
- Sinta-se à vontade para personalizar as cores e posições dos vários elementos no código para criar sua própria animação única.

## Explicação do Código

O código consiste em várias classes que representam diferentes elementos na animação:

- A classe `Rainbow` lida com o desenho do arco-íris com cores personalizáveis.
- A classe `House` representa a casa e permite a personalização das cores das paredes, do telhado, da porta e da maçaneta.
- A classe `Star` cria estrelas com posições e cores personalizáveis e gerencia sua rotação.
- A classe `Person` representa a pessoa na cena com cores personalizáveis para o corpo e os olhos.
- A classe `Eye` lida com o desenho dos olhos da pessoa e seu movimento com base na posição do mouse.

Na função `setup()`, o sketch inicializa o tamanho do canvas e cria instâncias das várias classes. A função `draw()` é responsável por renderizar a animação no canvas, incluindo o céu, a grama, a lua, a casa, a pessoa, as estrelas e o arco-íris. A função `keyPressed()` permite que o usuário controle o movimento da pessoa usando as teclas de seta.

## Personalização

Você pode personalizar vários aspectos da animação modificando os valores no código:

- Altere os valores das variáveis de cor para personalizar as cores do céu, da grama, da lua, das estrelas, das paredes da casa, do telhado da casa, da porta da casa, da maçaneta da casa, da pessoa e dos olhos da pessoa.
- Ajuste a posição das estrelas modificando as variáveis `STAR_X` e `STAR_Y`.
- Ative ou desative o efeito colorido do arco-íris alterando o valor da variável `RAINBOW_COLORFUL`.
- Personalize a posição e o tamanho da pessoa modificando as variáveis `personX` e `PERSON_SPEED`.
- Experimente diferentes valores e funcionalidades para criar sua própria animação única.

Sinta-se à vontade para explorar o código e fazer modificações de acordo com suas preferências.

## Contribuições

Contribuições para este projeto de animação são bem-vindas. Se encontrar algum problema ou quiser sugerir melhorias, sinta-se à vontade para enviar um pull request ou abrir uma issue.
