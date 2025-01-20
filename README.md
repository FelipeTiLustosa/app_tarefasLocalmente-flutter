# TAREFAS LOCALMENTE <img src="https://skillicons.dev/icons?i=flutter,dart" alt="Flutter & Dart Icons" style="vertical-align: middle; height: 35px;"/>

## 1. Visão Geral

O projeto **Tarefas Localmente** é um aplicativo de gerenciamento de tarefas, desenvolvido em Flutter, que utiliza armazenamento local para salvar informações, oferecendo uma interface amigável e intuitiva para organização diária. Este aplicativo foi projetado com o objetivo de explorar conceitos como persistência de dados, usabilidade e design moderno.

## 2. Funcionalidades

Abaixo estão listadas as principais funcionalidades do projeto:

| Funcionalidade | Descrição |
|----------------|-----------|
| **Adicionar Tarefa** | Permite criar tarefas com título, descrição e prazo de conclusão |
| **Editar e Excluir Tarefas** | Funcionalidades para gerenciar e excluir tarefas existentes |
| **Lista de Tarefas** | Exibição organizada de tarefas pendentes e concluídas |
| **Concluir Tarefas** | Opção para marcar uma tarefa como concluída |
| **Persistência Local** | Armazenamento e recuperação de dados usando SharedPreferences |
| **Design Responsivo** | Layout adaptável para diferentes tamanhos de tela |

## 3. Tecnologias Utilizadas

- **Linguagens**: [Dart](https://dart.dev/)
- **Framework**: [Flutter](https://flutter.dev/)
- **Bibliotecas Principais**:
  - [Shared Preferences](https://pub.dev/packages/shared_preferences): Armazenamento local de dados
  - [Device Preview](https://pub.dev/packages/device_preview): Simulação de dispositivos
  - [Intl](https://pub.dev/packages/intl): Formatação e internacionalização de datas

## 4. Links para Recursos Adicionais

- **Flutter**: [Documentação Oficial](https://flutter.dev/docs)
- **Dart**: [Dart Dev](https://dart.dev/guides)
- **Pub.dev**: [Pacotes Flutter](https://pub.dev)

## 5. Configuração e Execução

Siga os passos abaixo para configurar e executar o projeto localmente:

### 5.1. Pré-requisitos

- Flutter SDK ≥ 3.0.0
- Dart SDK ≥ 3.0.0
- Editor de código (VS Code ou Android Studio)
- Git instalado

### 5.2. Clonar o Repositório

```bash
git clone git@github.com:FelipeTiLustosa/app_tarefasLocalmente-flutter.git
cd app_tarefasLocalmente-flutter
```

### 5.3. Configurar e Executar

```bash
flutter pub get
flutter run
```

## 6. Contribuição

Contribuições são bem-vindas! Para contribuir com o projeto, siga estas etapas:

1. Faça um fork do repositório
2. Crie uma branch para sua feature
3. Realize as alterações e teste
4. Envie um pull request para revisão

## 7. Estrutura de Pastas

```
tarefas_localmente/
├── lib/
│   ├── models/
│   │   └── task.dart                # Classe modelo para tarefas
│   ├── screens/
│   │   ├── welcome_screen.dart      # Tela de boas-vindas
│   │   ├── tasks_screen.dart        # Tela principal com lista de tarefas
│   └── services/
│       └── storage_service.dart      # Serviço para armazenamento local
│   ├── widgets/
│       ├── task_form.dart           # Formulário para criação e edição de tarefas
│       └── task_tile.dart           # Componente visual para exibição das tarefas
│   └── main.dart                    # Arquivo principal
├── pubspec.yaml                     # Arquivo de configuração do projeto Flutter
```

## 8. Link do vídeo explicativo sobre o projeto

[Link do vídeo demonstrativo]()
