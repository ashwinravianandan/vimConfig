XPTemplate priority=personal

XPTinclude
         \ _common/personal
         \ _common/inlineComplete
         \ _common/common*

XPT fun
`RetVal^ `function name^( `arg list^ )
{
   `cursor^
   return /*`RetVal^*/;
}

XPT cppfunc
`RetVal^ `Namespace/class name^::`function name^( `arg list^ )
{
   `cursor^
   return /*`RetVal^*/;
}

XPT class
class `ClassName^
{
public:
   `ClassName^();
   virtual ~`ClassName^();
   `cursor^
};

"documentation
XPT doc
/*..............................................................................
 * @brief `FunctionName^
 *
 * Input Parameters:
 *    @param:`...^ 
 *       `^ `...^
 * Return Value:
 *    @returns `retVal^
 *
 * External methods/variables:
 *    @extern
 *............................................................................*/
`cursor^
XPT vct
std::vector<`Type^> `VectorName^

XPT vctit
std::vector<`Type^>::iterator `VectorName^

XPT map
std::map<`Type1^, `Type2^> `MapName^

XPT mapit
std::map<`Type1^, `Type2^>::iterator `MapName^


XPT forit
for (`it^=`mapName^.begin(); `it^ != `mapName^.end(); ++`it^)
{
   `cursor^;
}

XPT comm
/**
 * `your comment here^
 */

XPT main
int main()
{
   `cursor^
   return 0;
}

XPT todo
/**
 * @todo: `your comment here^ 
 */
`cursor^

XPT if
if ( `Condition^ )
{
   `if true^
}`else...{{^
else
{
   `if false^
}`}}^

XPT elif
if ( `Condition^ )
{
      `if true^
}`...{{^
else if ( `^ )
{
   `^
}`...^`}}^

XPT switch
switch ( `value^ )
{
   `...^case `case^:
      `code^
   break;

   `...^
   default:
   `^
   break;
}

XPT tern
( `Condition^ ) ? `if true^ : `if false^;

XPT while
while ( `Condition^ )
{
   `code^
}
`cursor^

