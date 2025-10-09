# Xcode-templates

My set of templates (file and code snippets) that I use on all of my projects. Some are copied from other sources, most are created to make following my coding patterns consistent across projects. Many of the file templates are of the 'use once when creating a project' and at some time in the future I may create a project template and tie these all together.

## Installation

Clone this project to local, then navigate to the root directory of the local archive and run `make`:

```shell
$ cd Xcode-templates
$ make
```

## Templates and Snippets provided
### Snippets
#### Comments
- **GWT**: Given-when-then comments to help 
- **MRK**: Add a Pragma Mark comment to assist code navigation
- **TD**: Add a Todo comment

#### Definitions (Types and Variables)
- **exerror**: Add an Error definition extension within a type for throwing errors. Creates {Type Name}.Error
- **exerrloc**: Add localized string output to an error type definition (see above)
- **sui-mc**: Add the Environment SwiftData ManagedContext to a View definition
- **sui-dis**: Add the Environment dismiss variable to a View definition
- **sui-flag**: Add a @State flag (to show a popover or something)
- **sui-var**: Add a @State variable

#### Methods
- **shoulda-fn**: Create a Swift Testing empty function (with a issue showing needs implementation)
- **sd-app-init**: Define the init method for the app struct to help define the context, uses the model list defined in 'Base SwiftData Model list' below.

#### In-line Code
- **td-let**: Tabular Data CSV import let definition for a column in a row

### File Templates
#### Source
- **Base**: A struct that contains app-wide definitions (app name, logging classes, other app specific things). Designed to work with the @AppStandard macro defined elsewhere. This file is usually located in the 'utility' directory under the main Source.
- **Base SwiftData Model list**: An extension to the Base file (see above) that is used to list the SwiftData Models to be includes in the Schema. Usually placed with all of the SwiftData model files in the 'models' directory. 
- **CSV Import Export**: A skeleton for doing CSV import/export (export method is not provided) with a framework for column definition and standardized loading.
- **CSVDataFrame**: A file to assist in creating a sized DataFrame (Tabular Data) that can be used as a CSV Export after loaded with data.
- **EntryPoint**: A replacement Entry point for the application that call the App main only if this is not a testing run
- **JSON Serializable**: A struct for import of the SwiftData DB from/to a JSON representation. Can be specialized for import/export tasks but in raw form is coupled with 'Preview MockData' to provide a load of data into an in-memory DB for Preview.
- **Preview MockData**: Create a file with a trait for Preview that uses an in-memory DB for the Preview pane
- **Standard Extensions**: A file with extensions to String, Int and DataFormatter that I use on every project.
- **SwiftData Model**: A template for all SwiftData model files, contains standard sections for help methods (scopes, sorting) and examples.

#### Testing
- **Better Swift Testing**: Create a new Swift Testing file for a unit test, has the header, is a struct and uses the @Suite to give a 'Shoulda' flavour
- **Swift Testing Setup**: A file to be added to the Test directory and target that contains helpers for Swift Testing, including an in-memory version of the SwiftData database (uses 'Base SwiftData Model list' from above)
- **XML Validate for Swift Testing**: