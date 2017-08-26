	// 类似 VB 的 Trim 函数
	function javaTrim(FieldName){
		var str=FieldName.value;
		var i=0;
		var j;
		var len=str.length;
		
		trimstr="";
		j=len-1;
		if(j<0) return trimstr;
		while (1){
			if (str.charAt(i)==" "){
				i++;
			}
			else{
				break;
			}
		} 
		while (1) {
			if (str.charAt(j)==" "){
				j--;;
			}
			else{
				break;
			}
		}
//		alert("str="+str);
		trimstr=str.substring(i,j+1);
//		alert("trimstr="+trimstr);
		FieldName.value=trimstr;
		return trimstr;
	}

	function strTrim(str){
		var i=0;
		var j;
		var len=str.length;
		
		trimstr="";
		j=len-1;
		if(j<0) return trimstr;
		while (1){
			if (str.charAt(i)==" "){
				i++;
			}
			else{
				break;
			}
		} 
		while (1) {
			if (str.charAt(j)==" "){
				j--;;
			}
			else{
				break;
			}
		}

//		alert("i="+i);
//		alert("j="+j);
//		alert("str="+str+"end");
		if (j==-1)
		{
			trimstr="";
		}
		else{
			trimstr=str.substring(i,j+1);
		}
//		alert("trimstr="+trimstr+"end");
		return trimstr;
	}


	// 正确的非 HTML 文字串。
	function javaValidString(str)
	{
		var len;
		
		len = str.length;
		for(var i=0; i<len; i++) 
		{
			if(str.charAt(i)=='<' || str.charAt(i)=='>' || str.charAt(i)=='\'' || str.charAt(i)=='\"') 
			{
				return false;
			}
		}
		return true;
	}
	
//测试是否为e-mail地址，true：正确；false：错误
	function isEmail(FieldName,FieldNote)
	{
		if (javaTrim(FieldName)==""){
			return true;
		}

		var cnt1, cnt2;
		var len1;
		var str=FieldName.value;
		if(javaValidString(str)==false) 
		{
			alert(FieldNote+"：格式输入不正确！");
			FieldName.focus();
			return false;
		}

		// 检查E-Mail是否正确！
		cnt1=0;
		cnt2=0;
		len1 = str.length;
		for(var i=0; i<len1; i++) {
			if(str.charAt(i)=='@') 
			{
				cnt1++;
			}
			if(str.charAt(i)=='.') 
			{
				cnt2++;
			}
			if(str.charAt(i)==' ')
			{
				alert(FieldNote+"：格式输入不正确！");
				FieldName.focus();
				return false;
			}
		}
		if( cnt1!=1 || cnt2<1)
		{
			alert(FieldNote+"：格式输入不正确！");
			FieldName.focus();
			return false;
		}
		return true;
	}
	
	// 正确的数字文字串。用于身份证等。
	function isNumber(FieldName,FieldNote)
	{
	
		if (FieldName.value==""){
			return true;
		}

		var str=FieldName.value;			
		var len = str.length;
		for(var i=0; i<len; i++) {
			if(!(str.charAt(i)>='0' && str.charAt(i)<='9')) 
			{
				alert(FieldNote+"：输入不正确，其中包括字符！"+str.charAt(i));
//				FieldName.value=""
				FieldName.select();
				return false;
			}
		}
		return true;
	}
	// 正确的电话。
	function isPhone(FieldName,FieldNote)
	{
	
		if (javaTrim(FieldName)==""){
			return true;
		}

		var str=FieldName.value;			
		var len = str.length;
		for(var i=0; i<len; i++) {
			if (!((str.charAt(i)>='0' && str.charAt(i)<='9')||(str.charAt(i)=='-'))) 
			{
				alert(FieldNote+"：输入不正确，电话号码只能包括数字和\“-\”");
//				FieldName.value=""
				FieldName.focus();
				return false;
			}
		}
		return true;
	}

//测试是否为整数，true：正确；false：错误
	function isInt(FieldName,FieldNote)
	{
		if (javaTrim(FieldName)==""){
			return true;
		}

		if (isNaN(parseInt(FieldName.value))) 
		{
			alert(FieldNote+"：输入的不是整数,请重输");
			FieldName.value="0"
			FieldName.select();
			return false;
		}
		else
		{
			FieldName.value=parseInt(FieldName.value)
			return true;
		}
	}	



//测试是否为实数，true：正确；false：错误
	function isFloat(FieldName,FieldNote)
	{
		if (javaTrim(FieldName)==""){
			return true;
		}

		if (isNaN(parseFloat(FieldName.value))) 
		{
			alert(FieldNote+"：输入的不是数字,请重输");
			FieldName.value="0"
			FieldName.focus();
			return false;
		}
		else
		{
			FieldName.value=parseFloat(FieldName.value)
			return true;
		}
	}	

//测试是否为日期型，true：正确；false：错误
	function isDatetime(FieldName,FieldNote)
	{
		if (javaTrim(FieldName)==""){
			return true;
		}
//		var regexp=/^(\d{4}\-\d{1}\-\d{1})$/;
//		var regexp1=/^(\d{4}\-\d{1}\-\d{2})$/;
//		var regexp2=/^(\d{4}\-\d{2}\-\d{1})$/;
		var regexp3=/^(\d{4}\-\d{2}\-\d{2})$/;

//		if ((!(regexp.test(FieldName.value)))&&(!(regexp1.test(FieldName.value)))
//		 &&(!(regexp2.test(FieldName.value)))&&(!(regexp3.test(FieldName.value))))
		if (!(regexp3.test(FieldName.value)))
		{
			alert(FieldNote+"：输入格式不正确,格式应该为（YYYY-MM-DD）（如：2000-02-02）");
			FieldName.focus();
			return false;
		}
		

		var DateArray=new Array(5);
		DateArray=FieldName.value.split("-");

//		if ((DateArray[0]<'1949')||(DateArray[0]>'2010'))
//		{
//			alert("输入的年份不正确");
//			FieldName.focus();
//			return false;
//		}

		if ((DateArray[1]<'01')||(parseInt(DateArray[1])>12))
		{
			alert(FieldNote+"：输入的月份不正确！"+DateArray[1]);
			FieldName.focus();
			return false;
		}
		if ((DateArray[2]<'01')||(parseInt(DateArray[2])>31))
		{
			alert(FieldNote+"：输入的日期不正确！");
			FieldName.focus();
			return false;
		}
		return true;

	}

function getNext(formName,zbTab,fbTab,rowNum,objectName)
{
	var index=-1;
	for (var i=0; i<zbTab.length;i++ )//查找当前对象在数组中的位置
	{
		if (zbTab[i]==objectName)//找到
		{
			index=i+1;
			if (zbTab.length>index)//不在主表最后一个字段
			{
				if (eval("formName."+zbTab[index]+"ch.checked")){//下一个字段被选，继续查找
					objectName=zbTab[index];
				}
				else{//下一个字段没有被选，结束
					return zbTab[index];//返回字段名
				}
			}
			else{//在主表最后一个字段
				if (eval("formName."+fbTab[0]+"ch.checked")){//附表第一个字段被选，继续查找附表
					objectName=fbTab[0]+"0";
					break;
				}
				else{//附表第一个字段没有被选，结束
					return fbTab[0]+"0";//返回字段名
				}
			}
		}
	}
	for (var i=0; i<fbTab.length;i++ )//主表没有找到在附表查找
	{
		if (rowNum<=0)
		{
			return "save";//返回存盘
		}
		var xh=objectName.substr(objectName.length-1);
//		alert("i="+i+";objectName="+objectName);
		if (fbTab[i]==objectName.substr(0,objectName.length-1))//找到
		{
//			alert("xh="+xh);
			index=i+1;
			if (fbTab.length>index)//不在附表最后一列
			{
				if (eval("formName."+fbTab[index]+"ch.checked")){//下一个字段被选，继续查找
					objectName=fbTab[index]+xh;
 				}
				else{//下一个字段没有被选，结束
					return fbTab[index]+xh;//返回字段名
				}
			}
			else{//在附表最后一列
				if (xh>=rowNum-1){//附表最后一行
					return "save";//返回存盘
				}
				else{//非最后一行，转下一行第一列
/*
					for (var i1=0; i1<fbTab.length;i1++ )//记录付值
					{
						if (eval("formName."+fbTab[0]+(parseInt(xh)+1)+".value")!="")//若第一列有值，不付值
						{
							break;
						}
						if (eval("formName."+fbTab[i1]+"ch.checked")){//下一个字段被选，付值
							eval("formName."+fbTab[i1]+(parseInt(xh)+1)+".value=formName."+fbTab[i1]+xh+".value")
						}
					}
*/
//					alert(objectName);
					for (var i=0; i<fbTab.length;i++ )//在下一行查找没有被选字段
					{
						if (!(eval("formName."+fbTab[i]+"ch.checked"))){//找到
							return fbTab[i]+(parseInt(xh)+1);
						}
					}
					return "save";//全部字段被选，返回
				}
			}
		}
	}
	return "error";

}

function getNextField(formName,zbTab,objectName)
{
	var index=-1;
	for (var i=0; i<zbTab.length;i++ )//查找当前对象在数组中的位置
	{
		if (zbTab[i]==objectName)//找到
		{
			index=i+1;
			if (zbTab.length>index)//不在主表最后一个字段
			{
				if (eval("formName."+zbTab[index]+"ch.checked")){//下一个字段被选，继续查找
					objectName=zbTab[index];
				}
				else{//下一个字段没有被选，结束
					return zbTab[index];//返回字段名
				}
			}
			else{//在主表最后一个字段
				return "save";//返回存盘
			}
		}
	}
}
function nextField(formName,zbTab,objectName)
{
	var index=-1;
	for (var i=0; i<zbTab.length;i++ )//查找当前对象在数组中的位置
	{
		if (zbTab[i]==objectName)//找到
		{
			index=i+1;
			if (zbTab.length>index)//不在主表最后一个字段
			{
				return zbTab[index];//返回字段名
			}
			else{//在主表最后一个字段
				return "save";//返回存盘
			}
		}
	}
}


function getPrior(formName,zbTab,fbTab,rowNum,obName)
{
}

function selectItem(field1,field2,str)//上级,下级
{ 
	var parentcode = field1.options[field1.selectedIndex].value;

	lstart=str.indexOf("["+parentcode+"]");
	if (lstart==-1)
	{
		field2.length=0;
		return;
	}
	str=str.substring(lstart);
	lstart=str.indexOf("]");
	str=str.substring(lstart+1);
	lend=str.indexOf("[");
	if (lend!=-1)
	{
		str=str.substring(0,lend);
	}

	var i=0;
	field2.options[i] = new Option("","" );
	i++;
	while((str!="")&&(str!=null))
	{
		lstart=str.indexOf("%");
		lend=str.indexOf("+");
		if (lend==-1)
		{
			lend=str.length;
		}
		lcode=str.substring(0,lstart);
		lname=str.substring(lstart+1,lend);
		field2.options[i] = new Option(lcode,lname );
		i++;
		str=str.substring(lend+1,str.length);
	}
	field2.length = i;
}

//按回车后光标跳转到域：fielName
function keyGo(fielName)
{
	if (event.keyCode==13)	
	{
		fielName.select();
	}
}


//把源下拉数据被选择数据添加到目的中，不删除源数据
function addItem(fromField,toField)//参数FormName:Form的名称
{
	for (var i=0; i<fromField.options.length; i++)
	{
		if (fromField.options[i].selected)
		{
			var op1=document.createElement("OPTION");
			op1.text=fromField.options[i].text;
			op1.value=fromField.options[i].value;
			toField.add(op1);
		}
	}
}
//把源下拉数据被选择数据移动到目的中，删除源数据
function moveItem(fromField,toField)//参数FormName:Form的名称
{
	for (var i=0; i<fromField.options.length; i++)
	{
		if (fromField.options[i].selected)
		{
			var op1=document.createElement("OPTION");
			op1.text=fromField.options[i].text;
			op1.value=fromField.options[i].value;
			toField.add(op1);
		}
	}
	for (var i=fromField.options.length-1; i>=0; --i)
	{
		if (fromField.options[i].selected)
		{
			fromField.remove(i);
		}
	}
}

//全选
function selectAll(selectedField)//参数FormName:Form的名称
{
	for(i=0;i<selectedField.length;i++){                                                                         
		selectedField.options[i].selected = true;                                                                         
	}                                                                        
}

//测试Radio按钮是否被选，使用多条，不使用单条
function radioChecked(radioName)
{
	for (var i=0;i<radioName.length ;i++ )
	{
		if (radioName[i].checked)
		{
			return true;
		}
	}
	return false;
}	
