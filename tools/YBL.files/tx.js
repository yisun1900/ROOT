<!-- Begin
var qiksearch_js_text = new Array ("优铂利软件  管理者梦工场!", "YBL珠宝供应链管理系统", "YBL客户呼叫系统", "YBL Jcoding开发平台", "YBL 人事管理系统", "YBL 智能报表系统", "YBL超市管理系统", "YBL 医药GMS系统");
var qiksearch_space_width = 300; // The width of the content space
var qiksearch_space_height = 30; // The height of the content space
var qiksearch_space_borderw=0; // Border width
var qiksearch_space_borderc="#CC0000"; // Border Color
var timeOutVal=150; // Delay in milliseconds

//--------------------------------------------------------------------------------------------

//-----------------------------DO-NOT-MODIFY-BELOW-THIS---------------------------------------

document.write('<table width="' + qiksearch_space_width + '" height="' + qiksearch_space_height + '" style="background; border:' + qiksearch_space_borderw + ' solid ' + qiksearch_space_borderc + '"><tr><td align="middle">');
document.write('<div id="qiksearch_js_space">');
document.write('</div>');
document.write('</td></tr></table>');

var def_10='A',def_11='B',def_12='C',def_13='D',def_14='E',def_15='F';
var colorVal=15;
var div_count=0;

function qiksearch_fade_desat(getColorIntVal)
{
 var returnVal;
 if(getColorIntVal>=10)
 {
  for(var i=0; i<=15; i++)
  {
   if((getColorIntVal==i))
   {
    returnVal = eval('def_' + i);
   }
  }
 }
 else
 {
  returnVal=getColorIntVal;
 }
 return(returnVal);
} 

function writeDiv()
{
 document.all.qiksearch_js_space.innerHTML= '<font face="verdana,arial,helvetica" size="+1" color="' +  joinColor(qiksearch_fade_desat(colorVal)) + '"><b>' + qiksearch_js_text[div_count] + '</span></b></font>' ;

 if((colorVal>0)  && (colorVal!=0))
 {
  colorVal--;
 }
 else
 {
  colorVal=15;
  if(div_count<qiksearch_js_text.length)
  {
   div_count++;
  }
  if(div_count==qiksearch_js_text.length)
  {
   document.all.qiksearch_js_space.innerHTML = '<a href="javascript:resetAll();writeDiv();" style="text-decoration:none" accesskey="l"><font color="#808080" face="verdana,arial,helvetica" size="-1"><b>优铂利软件 管理者梦工场</b></font></a>';
  }
 }

 if(div_count<qiksearch_js_text.length)
 {
  setTimeout("writeDiv()",timeOutVal);
 }
}

function joinColor(getColor)
{
 return (getColor + '0' + getColor + '0' + getColor + '0');
}

function resetAll()
{
 div_count=0;
 colorVal=15;
}

writeDiv();
//  End -->