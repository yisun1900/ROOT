	// 类似 VB 的 Trim 函数
	function javaTrim(FieldName)
	{
		var str=FieldName.value;
		var i=0;
		var j;
		var len=str.length;
		
		trimstr="";
		j=len-1;
		if(j<0) return trimstr;

		while (1)
		{
			if (str.charAt(i)==" "){
				i++;
			}
			else{
				break;
			}
		} 

		while (1) 
		{
			if (str.charAt(j)==" "){
				j--;;
			}
			else{
				break;
			}
		}

		if (j==-1)
		{
			trimstr="";
		}
		else{
			trimstr=str.substring(i,j+1);
		}

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


	function trim(str)
	{
		if(str=="") return "";

		while (true)
		{
			if (str.substring(0,1)=="\r")
			{
				str=str.substring(1);
			}
			else if (str.substring(0,1)=="\n")
			{
				str=str.substring(1);
			}
			else{
				break;
			}
		}

		while (true)
		{
			if (str.substring(str.length-1,str.length)=="\r")
			{
				str=str.substring(0,str.length-1);
			}
			else if (str.substring(str.length-1,str.length)=="\n")
			{
				str=str.substring(0,str.length-1);
			}
			else{
				break;
			}
		}

		if(str=="") return "";

		var len=str.length;
		
		//取消左侧空格
		var i=0;
		while (1)
		{
			if (str.charAt(i)==" ")
			{
				i++;
			}
			else{
				break;
			}
		}
		
		//取消右侧空格
		var j=len-1;
		while (1) 
		{
			if (str.charAt(j)==" ")
			{
				j--;;
			}
			else{
				break;
			}
		}

//		alert("i="+i);
//		alert("j="+j);
//		alert("str="+str+"end");
		var trimstr="";
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
		if (len<6)
		{
			alert(FieldNote+"：输入不正确，电话的长度不能小于6位");
			FieldName.focus();
			return false;
		}
		for(var i=0; i<len; i++) 
		{
			if (  !(  (str.charAt(i)>='0' && str.charAt(i)<='9')  ||  (str.charAt(i)=='-')  ||  (str.charAt(i)==',')  )  ) 
			{
				alert(FieldNote+"：输入不正确，电话号码只能包括『0-9的数字』、『-』或『英文逗号』");
				FieldName.focus();
				return false;
			}
		}
		return true;
	}

	// 正确的手机。
	function isMPhone(FieldName,FieldNote)
	{
	
		if (javaTrim(FieldName)==""){
			return true;
		}

		var str=FieldName.value;			
		var len = str.length;
		if (len<11)
		{
			alert(FieldNote+"：输入不正确，手机的长度不能小于11位");
			FieldName.focus();
			return false;
		}

		if (str.charAt(0)!='1')
		{
			alert(FieldNote+"：输入不正确，手机得第一位必须是1");
			FieldName.focus();
			return false;
		}

		for(var i=0; i<len; i++) 
		{
			if (  !( str.charAt(i)>='0' && str.charAt(i)<='9')    ) 
			{
				alert(FieldNote+"：输入不正确，电话号码只能包括『0-9的数字』");
				FieldName.focus();
				return false;
			}
		}
		return true;
	}
	// 正确的做机。
	function isTPhone(FieldName,FieldNote)
	{
	
		if (javaTrim(FieldName)==""){
			return true;
		}

		var str=FieldName.value;			
		var len = str.length;

		if (str.charAt(0)=='1')
		{
			alert(FieldNote+"：输入不正确，座机得第一位不能是1");
			FieldName.focus();
			return false;
		}

		for(var i=0; i<len; i++) 
		{
			if (  !( str.charAt(i)>='0' && str.charAt(i)<='9')   ) 
			{
				alert(FieldNote+"：输入不正确，电话号码只能包括『0-9的数字』");
				FieldName.focus();
				return false;
			}
		}
		return true;
	}
	// 正确的身份证号码。
	function isSfzhm(FieldName,FieldNote)
	{
	
		if (javaTrim(FieldName)==""){
			return true;
		}

		var str=FieldName.value;			
		var len = str.length;

		if(len!=15 && len!=18) 
		{
			alert(FieldNote+"：输入不正确，只能是15位或18位");
				FieldName.focus();
			return false;
		}

		for(var i=0; i<len; i++) 
		{
			if (  !(  (str.charAt(i)>='0' && str.charAt(i)<='9')  ||  (str.charAt(i)=='X')  )  ) 
			{
				alert(FieldNote+"：输入不正确，身份证号码只能包括『0-9的数字』或『X』");
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
//			FieldName.value="0"
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
//			FieldName.value="0"
			FieldName.select();
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
			FieldName.select();
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
			FieldName.select();
			return false;
		}
		if ((DateArray[2]<'01')||(parseInt(DateArray[2])>31))
		{
			alert(FieldNote+"：输入的日期不正确！");
			FieldName.select();
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

function goNextField(formName,zbTab,objectName)
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
					eval("formName."+zbTab[index]+".select()");
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
		field2.options[0] = new Option("","" );
		field2.length = 1;
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

function makeItem(field1,field2,str)//上级,下级
{ 
	var parentcode = field1;
//	alert(parentcode);

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

//把字符串转换为下拉列表数据，用%、+分割
//不同行%分割，同一行用＋分割
function strToSelect(field,str)
{ 

	while (true)
	{
		if (str.substring(0,1)=="\r")
		{
			str=str.substring(1);
		}
		else if (str.substring(0,1)=="\n")
		{
			str=str.substring(1);
		}
		else{
			break;
		}
	}

	while (true)
	{
		if (str.substring(str.length-1,str.length)=="\r")
		{
			str=str.substring(0,str.length-1);
		}
		else if (str.substring(str.length-1,str.length)=="\n")
		{
			str=str.substring(0,str.length-1);
		}
		else{
			break;
		}
	}

	if (str=="")
	{
		return;
	}


	if (str.substring(0,1)=="%")
	{
		str=str.substring(1);
	}

	var i=0;
	field.options[i] = new Option("","" );
	i++;
	while((str!="")&&(str!=null))
	{
		lstart=str.indexOf("+");
		lend=str.indexOf("%");
		if (lend==-1)
		{
			lend=str.length;
		}
		lcode=str.substring(0,lstart);
		lname=str.substring(lstart+1,lend);

		field.options[i] = new Option(lname,lcode );
		i++;
		str=str.substring(lend+1,str.length);
	}
	field.length = i;
}

//把字符串转换为下拉列表数据，用%、+分割
//不同行%分割，同一行用＋分割
function strToItem(field,str)
{ 
	if (str=="")
	{
		return;
	}

	var i=0;
	field.options[i] = new Option("","" );
	i++;
	while((str!="")&&(str!=null))
	{
		lstart=str.indexOf("+");
		lend=str.indexOf("%");
		if (lend==-1)
		{
			lend=str.length;
		}
		lcode=str.substring(0,lstart);
		lname=str.substring(lstart+1,lend);

		field.options[i] = new Option(lname,lcode );
		i++;
		str=str.substring(lend+1,str.length);
	}
	field.length = i;
}

//把字符串转换为下拉列表数据，用^、~分割
function strToItem1(field,str)
{ 
	if (str=="")
	{
		return;
	}

	var i=0;
	field.options[i] = new Option("","" );
	i++;
	while((str!="")&&(str!=null))
	{
		lstart=str.indexOf("~");
		lend=str.indexOf("^");
		if (lend==-1)
		{
			lend=str.length;
		}
		lcode=str.substring(0,lstart);
		lname=str.substring(lstart+1,lend);
		field.options[i] = new Option(lname,lcode );
		i++;
		str=str.substring(lend+1,str.length);
	}
	field.length = i;
}

//把字符串转换为下拉列表数据，用^、~分割
function makeSelect(field,str)
{ 
	if (str=="")
	{
		return;
	}

	var i=0;
	while((str!="")&&(str!=null))
	{
		lstart=str.indexOf("~");
		lend=str.indexOf("^");
		if (lend==-1)
		{
			lend=str.length;
		}
		lcode=str.substring(0,lstart);
		lname=str.substring(lstart+1,lend);
		field.options[i] = new Option(lname,lcode );
		i++;
		str=str.substring(lend+1,str.length);
	}
	field.length = i;
}


//把字符串转换为下拉列表数据，用%分割，有空行
//不同行%分割
function strToItem2(field,str)
{ 
	while (true)
	{
		if (str.substring(0,1)=="\r")
		{
			str=str.substring(1);
		}
		else if (str.substring(0,1)=="\n")
		{
			str=str.substring(1);
		}
		else{
			break;
		}
	}

	if (str=="")
	{
		return;
	}


	if (str.substring(0,1)=="%")
	{
		str=str.substring(1);
	}

	var dateArray=str.split("%");

	field.options[0] = new Option("","" );


	for (var i=0;i<dateArray.length;i++  )
	{
		field.options[i+1] = new Option(dateArray[i],dateArray[i] );
	}

}


//把字符串转换为下拉列表数据，用%分割，无空行
//不同行%分割
function strToItem3(field,str)
{ 
	while (true)
	{
		if (str.substring(0,1)=="\r")
		{
			str=str.substring(1);
		}
		else if (str.substring(0,1)=="\n")
		{
			str=str.substring(1);
		}
		else{
			break;
		}
	}

	if (str=="")
	{
		return;
	}


	if (str.substring(0,1)=="%")
	{
		str=str.substring(1);
	}

	var dateArray=str.split("%");

	for (var i=0;i<dateArray.length;i++  )
	{
		field.options[i] = new Option(dateArray[i],dateArray[i] );
	}

}


//按回车后光标跳转到域：fielName
function keyGo(fielName)
{
	if (event.keyCode==13)	
	{
		fielName.select();
	}
}
function keyTo(fielName)
{
	if (event.keyCode==13)	
	{
		fielName.focus();
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
//全不选
function notAll(selectedField)//参数FormName:Form的名称
{
	for(i=0;i<selectedField.length;i++){                                                                         
		selectedField.options[i].selected = false;                                                                         
	}                                                                        
}
//全不选
function notRadio(selectedField)//参数FormName:Form的名称
{
	for(i=0;i<selectedField.length;i++){                                                                         
		selectedField[i].checked = false;                                                                         
	}                                                                        
}

//多选下拉列表框是否选择
function selectChecked(selectedField)//参数FormName:Form的名称
{
	for(i=0;i<selectedField.length;i++){                                                                         
		if (selectedField.options[i].selected && selectedField.options[i].value!="")
		{
			return true; 
		}
	}
	return false; 
}

//测试Radio按钮是否被选
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

//获取Radio按钮是被选值
function getRadio(radioName)
{
	for (var i=0;i<radioName.length ;i++ )
	{
		if (radioName[i].checked)
		{
			return radioName[i].value;
		}
	}
	return "";
}	

function getJg(f1,f2)//参数FormName:Form的名称
{
	f2.value=f1.options[f1.selectedIndex].text.substring(f1.options[f1.selectedIndex].text.indexOf(":")+1);
}
function getSubStr(f1)//参数FormName:Form的名称
{
	return f1.options[f1.selectedIndex].text.substring(f1.options[f1.selectedIndex].text.indexOf(":")+1);
}

function getItemValue(f1,f2)//参数FormName:Form的名称
{
	f2.value=f1.options[f1.selectedIndex].value;
}

function replace(str,oldstr,newstr)//替换字符串
{ 
	lstart=str.indexOf(oldstr);
	if (lstart!=-1)
	{
		str=str.substring(0,lstart)+newstr+str.substring(lstart+oldstr.length);
	}
	return str;
}

//测试是否为时间型，true：正确；false：错误
function isTime(FieldName,FieldNote)
{
	if (javaTrim(FieldName)==""){
		return true;
	}
	var regexp3=/^(\d{2}\:\d{2})$/;

	if (!(regexp3.test(FieldName.value)))
	{
		alert(FieldNote+"：输入格式不正确,格式应该为（HH:MM）（如：12:34）");
		FieldName.select();
		return false;
	}
	

	var DateArray=new Array(2);
	DateArray=FieldName.value.split(":");
	
	if ((DateArray[1]<'00')||(parseInt(DateArray[1])>60))
	{
		alert(FieldNote+"：输入的分钟不正确！"+DateArray[1]);
		FieldName.select();
		return false;
	}
	if ((DateArray[0]<'00')||(parseInt(DateArray[0])>24))
	{
		alert(FieldNote+"：输入的小时不正确！");
		FieldName.select();
		return false;
	}
	return true;

}


//保留小数位数
//sz需要处理的数值
//xs保留的小数位数
//返回处理后的数值
function formatDouble(sz,xs)
{
	var js=1;
	for (var i=0;i<xs ;i++ )
	{
		js=js*10;
	}
	var ret=sz*js+0.5;
	ret=parseInt(ret)/js;
	return ret;

}

//保留小数位数
//sz需要处理的数值
//xs保留的小数位数
//返回处理后的数值
function round(sz,xs)
{
	var js=1;
	for (var i=0;i<xs ;i++ )
	{
		js=js*10;
	}
	var ret=sz*js;
	if (ret<0)
	{
		ret=ret-0.5;
	}
	else{
		ret=ret+0.5;
	}
	ret=parseInt(ret)/js;
	return ret;

}

function winOpen(Url,width,height,scrollbar,resize)//使弹出的窗口居中
{
	ow = width;
	oh = height;
	os = scrollbar;
	or = resize;
	var xposition=0; 
	var yposition=0;
	if ((parseInt(navigator.appVersion) >= 4 ))
	{
		xposition = (screen.width - width) / 2;
		yposition = (screen.height - height-25) / 2;
	}
	window.open (Url,"","width ="+ow+",height="+oh+",scrollbars = "+os+",resizable="+or+",left="+xposition+",top="+yposition );
} 



//日期dateStr加addInt天
function addDay(dateStr,addInt)
{
	var retDateStr="";
	
	var inYear=dateStr.substring(0,4);

	var inMonth=0;
	if (dateStr.substring(5,7)<"10")
	{
		inMonth=parseInt(dateStr.substring(6,7))-1;
	}
	else{
		inMonth=parseInt(dateStr.substring(5,7))-1;
	}

	var inDay=0;
	if (dateStr.substring(8,10)<"10")
	{
		inDay=parseInt(dateStr.substring(9,10));
	}
	else{
		inDay=parseInt(dateStr.substring(8,10));
	}
	inDay=inDay+addInt;

	var retDate=new Date(inYear,inMonth,inDay);
	var year=retDate.getYear();
	var month=retDate.getMonth()+1;
	var day=retDate.getDate();

	if (month<10)
	{
		month="0"+month;
	}
	if (day<10)
	{
		day="0"+day;
	}

	retDateStr=year+"-"+month+"-"+day;

	return retDateStr;
}

//日期dateStr加addInt月
function addMonth(dateStr,addInt)
{
	var retDateStr="";
	
	var inYear=dateStr.substring(0,4);

	var inMonth=0;
	if (dateStr.substring(5,7)<"10")
	{
		inMonth=parseInt(dateStr.substring(6,7))-1;
	}
	else{
		inMonth=parseInt(dateStr.substring(5,7))-1;
	}

	var inDay=0;
	if (dateStr.substring(8,10)<"10")
	{
		inDay=parseInt(dateStr.substring(9,10));
	}
	else{
		inDay=parseInt(dateStr.substring(8,10));
	}
	inMonth=inMonth+addInt;

	var retDate=new Date(inYear,inMonth,inDay);
	var year=retDate.getYear();
	var month=retDate.getMonth()+1;
	var day=retDate.getDate();

	if (month<10)
	{
		month="0"+month;
	}
	if (day<10)
	{
		day="0"+day;
	}

	retDateStr=year+"-"+month+"-"+day;

	return retDateStr;
}

//日期dateStr加addInt年
function addYear(dateStr,addInt)
{
	var retDateStr="";
	
	var inYear=parseInt(dateStr.substring(0,4));

	var inMonth=0;
	if (dateStr.substring(5,7)<"10")
	{
		inMonth=parseInt(dateStr.substring(6,7))-1;
	}
	else{
		inMonth=parseInt(dateStr.substring(5,7))-1;
	}

	var inDay=0;
	if (dateStr.substring(8,10)<"10")
	{
		inDay=parseInt(dateStr.substring(9,10));
	}
	else{
		inDay=parseInt(dateStr.substring(8,10));
	}
	inYear=inYear+addInt;

	var retDate=new Date(inYear,inMonth,inDay);
	var year=retDate.getYear();
	var month=retDate.getMonth()+1;
	var day=retDate.getDate();

	if (month<10)
	{
		month="0"+month;
	}
	if (day<10)
	{
		day="0"+day;
	}

	retDateStr=year+"-"+month+"-"+day;

	return retDateStr;
}


//取字符串中的子串，每个子串以[valuei]开始，如：第一个为[value1]，第二个为[value2]
function getStrValue(str,xh)
{ 
	if (str=="")
	{
		return "";
	}
	else{

		var startDiv="[value"+xh+"]";

		lstart=str.indexOf(startDiv);
		if (lstart==-1)
		{
			return "";
		}

		lend=str.indexOf("[value"+(parseInt(xh)+1)+"]");

		var substr="";
		if (lend==-1)
		{
			substr=str.substring(lstart+startDiv.length);
		}
		else{
			substr=str.substring(lstart+startDiv.length,lend);
		}

		return substr;
	}
}


// 是否大写。
function isUpperCase(FieldName,FieldNote)
{

	if (FieldName.value==""){
		return true;
	}

	var str=FieldName.value;			
	var len = str.length;
	for(var i=0; i<len; i++) {
		if(str.charAt(i)>='a' && str.charAt(i)<='z') 
		{
			alert(FieldNote+"：输入不正确，其中包括小写字符！"+str.charAt(i));
			FieldName.select();
			return false;
		}
	}
	return true;
}


// 是否小写。
function isLowerCase(FieldName,FieldNote)
{

	if (FieldName.value==""){
		return true;
	}

	var str=FieldName.value;			
	var len = str.length;
	for(var i=0; i<len; i++) {
		if(str.charAt(i)>='A' && str.charAt(i)<='Z') 
		{
			alert(FieldNote+"：输入不正确，其中包括大写字符！"+str.charAt(i));
			FieldName.select();
			return false;
		}
	}
	return true;
}

//新增转换UTF8－－>汉字
  function   utf8CodeToChineseChar(strUtf8)   
  {   
      var   iCode,   iCode1,   iCode2;   
      iCode   =   parseInt("0x"   +   strUtf8.substr(1,   2));   
      iCode1   =   parseInt("0x"   +   strUtf8.substr(4,   2));   
      iCode2   =   parseInt("0x"   +   strUtf8.substr(7,   2));   
        
      return   String.fromCharCode(((iCode & 0x0F) << 12) | ((iCode1 & 0x3F) << 6) | (iCode2 & 0x3F));   
  }   
    
  //   将   UTF8   编码的   URL   中的中文部分（<   0xFFFF）转换过来   
function   chineseFromUtf8Url(strUtf8)     
{   
	var   bstr   =   "";   
	var   nOffset   =   0; //   processing   point   on   strUtf8   

	if(   strUtf8   ==   ""   )   
		return   "";   

	strUtf8   =   strUtf8.toLowerCase();   
	nOffset   =   strUtf8.indexOf("%e");   
	if(   nOffset   ==   -1   )   
		return   strUtf8;   

	while(   nOffset   !=   -1   )   
	{   
		bstr   +=   strUtf8.substr(0,   nOffset);   
		strUtf8   =   strUtf8.substr(nOffset,   strUtf8.length   -   nOffset);   
		if(   strUtf8   ==   ""   ||   strUtf8.length   <   9   )       //   bad   string   
			return   bstr;   

		bstr   +=   utf8CodeToChineseChar(strUtf8.substr(0,   9));   
		strUtf8   =   strUtf8.substr(9,   strUtf8.length   -   9);   
		nOffset   =   strUtf8.indexOf("%e");   
	}   

	return   bstr   +   strUtf8;   
}   
    

function days(date1,date2)//替换字符串
{ 
	date1=replace(date1,"-","/");
	date2=replace(date2,"-","/");

	var num=(new Date(date1)-new Date(date2))/1000/60/60/24;

	return num;
}
