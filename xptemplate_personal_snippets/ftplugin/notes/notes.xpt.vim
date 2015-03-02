XPTemplate priority=personal

XPTinclude
         \ _common/personal
         \ _common/inlineComplete
         \ _common/common*

XPT plantuml
<!---
@startuml "`Filename^"
`cursor^
@enduml
-->

![](./images/plantUML/`Filename^)

XPT ilink
[ `link-text^ ](#`link-location^)

XPT link
[ `link-text^ ](`link-location^)
