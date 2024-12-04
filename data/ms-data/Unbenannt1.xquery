declare namespace my="my-functions.uri";

declare function my:separateWords ($inputString as xs:string) as element()*
{
if (contains($inputString,' '))
then <word>{substring-before($inputString,' ')}</word>, my:separateWords(substring-after($inputString,' '))
else (<word>{$inputString}</word>)
};