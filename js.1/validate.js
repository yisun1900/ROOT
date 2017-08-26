	// ���� VB �� Trim ����
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
		
		//ȡ�����ո�
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
		
		//ȡ���Ҳ�ո�
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


	// ��ȷ�ķ� HTML ���ִ���
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
	
//�����Ƿ�Ϊe-mail��ַ��true����ȷ��false������
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
			alert(FieldNote+"����ʽ���벻��ȷ��");
			FieldName.focus();
			return false;
		}

		// ���E-Mail�Ƿ���ȷ��
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
				alert(FieldNote+"����ʽ���벻��ȷ��");
				FieldName.focus();
				return false;
			}
		}
		if( cnt1!=1 || cnt2<1)
		{
			alert(FieldNote+"����ʽ���벻��ȷ��");
			FieldName.focus();
			return false;
		}
		return true;
	}
	
	// ��ȷ���������ִ����������֤�ȡ�
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
				alert(FieldNote+"�����벻��ȷ�����а����ַ���"+str.charAt(i));
//				FieldName.value=""
				FieldName.select();
				return false;
			}
		}
		return true;
	}
	// ��ȷ�ĵ绰��
	function isPhone(FieldName,FieldNote)
	{
	
		if (javaTrim(FieldName)==""){
			return true;
		}

		var str=FieldName.value;			
		var len = str.length;
		if (len<6)
		{
			alert(FieldNote+"�����벻��ȷ���绰�ĳ��Ȳ���С��6λ");
			FieldName.focus();
			return false;
		}
		for(var i=0; i<len; i++) 
		{
			if (  !(  (str.charAt(i)>='0' && str.charAt(i)<='9')  ||  (str.charAt(i)=='-')  ||  (str.charAt(i)==',')  )  ) 
			{
				alert(FieldNote+"�����벻��ȷ���绰����ֻ�ܰ�����0-9�����֡�����-����Ӣ�Ķ��š�");
				FieldName.focus();
				return false;
			}
		}
		return true;
	}

	// ��ȷ���ֻ���
	function isMPhone(FieldName,FieldNote)
	{
	
		if (javaTrim(FieldName)==""){
			return true;
		}

		var str=FieldName.value;			
		var len = str.length;
		if (len<11)
		{
			alert(FieldNote+"�����벻��ȷ���ֻ��ĳ��Ȳ���С��11λ");
			FieldName.focus();
			return false;
		}

		if (str.charAt(0)!='1')
		{
			alert(FieldNote+"�����벻��ȷ���ֻ��õ�һλ������1");
			FieldName.focus();
			return false;
		}

		for(var i=0; i<len; i++) 
		{
			if (  !( str.charAt(i)>='0' && str.charAt(i)<='9')    ) 
			{
				alert(FieldNote+"�����벻��ȷ���绰����ֻ�ܰ�����0-9�����֡�");
				FieldName.focus();
				return false;
			}
		}
		return true;
	}
	// ��ȷ��������
	function isTPhone(FieldName,FieldNote)
	{
	
		if (javaTrim(FieldName)==""){
			return true;
		}

		var str=FieldName.value;			
		var len = str.length;

		if (str.charAt(0)=='1')
		{
			alert(FieldNote+"�����벻��ȷ�������õ�һλ������1");
			FieldName.focus();
			return false;
		}

		for(var i=0; i<len; i++) 
		{
			if (  !( str.charAt(i)>='0' && str.charAt(i)<='9')   ) 
			{
				alert(FieldNote+"�����벻��ȷ���绰����ֻ�ܰ�����0-9�����֡�");
				FieldName.focus();
				return false;
			}
		}
		return true;
	}
	// ��ȷ�����֤���롣
	function isSfzhm(FieldName,FieldNote)
	{
	
		if (javaTrim(FieldName)==""){
			return true;
		}

		var str=FieldName.value;			
		var len = str.length;

		if(len!=15 && len!=18) 
		{
			alert(FieldNote+"�����벻��ȷ��ֻ����15λ��18λ");
				FieldName.focus();
			return false;
		}

		for(var i=0; i<len; i++) 
		{
			if (  !(  (str.charAt(i)>='0' && str.charAt(i)<='9')  ||  (str.charAt(i)=='X')  )  ) 
			{
				alert(FieldNote+"�����벻��ȷ�����֤����ֻ�ܰ�����0-9�����֡���X��");
				FieldName.focus();
				return false;
			}
		}

		
		return true;
	}

//�����Ƿ�Ϊ������true����ȷ��false������
	function isInt(FieldName,FieldNote)
	{
		if (javaTrim(FieldName)==""){
			return true;
		}

		if (isNaN(parseInt(FieldName.value))) 
		{
			alert(FieldNote+"������Ĳ�������,������");
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



//�����Ƿ�Ϊʵ����true����ȷ��false������
	function isFloat(FieldName,FieldNote)
	{
		if (javaTrim(FieldName)==""){
			return true;
		}

		if (isNaN(parseFloat(FieldName.value))) 
		{
			alert(FieldNote+"������Ĳ�������,������");
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

//�����Ƿ�Ϊ�����ͣ�true����ȷ��false������
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
			alert(FieldNote+"�������ʽ����ȷ,��ʽӦ��Ϊ��YYYY-MM-DD�����磺2000-02-02��");
			FieldName.select();
			return false;
		}
		

		var DateArray=new Array(5);
		DateArray=FieldName.value.split("-");

//		if ((DateArray[0]<'1949')||(DateArray[0]>'2010'))
//		{
//			alert("�������ݲ���ȷ");
//			FieldName.focus();
//			return false;
//		}

		if ((DateArray[1]<'01')||(parseInt(DateArray[1])>12))
		{
			alert(FieldNote+"��������·ݲ���ȷ��"+DateArray[1]);
			FieldName.select();
			return false;
		}
		if ((DateArray[2]<'01')||(parseInt(DateArray[2])>31))
		{
			alert(FieldNote+"����������ڲ���ȷ��");
			FieldName.select();
			return false;
		}
		return true;

	}

function getNext(formName,zbTab,fbTab,rowNum,objectName)
{
	var index=-1;
	for (var i=0; i<zbTab.length;i++ )//���ҵ�ǰ�����������е�λ��
	{
		if (zbTab[i]==objectName)//�ҵ�
		{
			index=i+1;
			if (zbTab.length>index)//�����������һ���ֶ�
			{
				if (eval("formName."+zbTab[index]+"ch.checked")){//��һ���ֶα�ѡ����������
					objectName=zbTab[index];
				}
				else{//��һ���ֶ�û�б�ѡ������
					return zbTab[index];//�����ֶ���
				}
			}
			else{//���������һ���ֶ�
				if (eval("formName."+fbTab[0]+"ch.checked")){//�����һ���ֶα�ѡ���������Ҹ���
					objectName=fbTab[0]+"0";
					break;
				}
				else{//�����һ���ֶ�û�б�ѡ������
					return fbTab[0]+"0";//�����ֶ���
				}
			}
		}
	}
	for (var i=0; i<fbTab.length;i++ )//����û���ҵ��ڸ������
	{
		if (rowNum<=0)
		{
			return "save";//���ش���
		}
		var xh=objectName.substr(objectName.length-1);
//		alert("i="+i+";objectName="+objectName);
		if (fbTab[i]==objectName.substr(0,objectName.length-1))//�ҵ�
		{
//			alert("xh="+xh);
			index=i+1;
			if (fbTab.length>index)//���ڸ������һ��
			{
				if (eval("formName."+fbTab[index]+"ch.checked")){//��һ���ֶα�ѡ����������
					objectName=fbTab[index]+xh;
 				}
				else{//��һ���ֶ�û�б�ѡ������
					return fbTab[index]+xh;//�����ֶ���
				}
			}
			else{//�ڸ������һ��
				if (xh>=rowNum-1){//�������һ��
					return "save";//���ش���
				}
				else{//�����һ�У�ת��һ�е�һ��
/*
					for (var i1=0; i1<fbTab.length;i1++ )//��¼��ֵ
					{
						if (eval("formName."+fbTab[0]+(parseInt(xh)+1)+".value")!="")//����һ����ֵ������ֵ
						{
							break;
						}
						if (eval("formName."+fbTab[i1]+"ch.checked")){//��һ���ֶα�ѡ����ֵ
							eval("formName."+fbTab[i1]+(parseInt(xh)+1)+".value=formName."+fbTab[i1]+xh+".value")
						}
					}
*/
//					alert(objectName);
					for (var i=0; i<fbTab.length;i++ )//����һ�в���û�б�ѡ�ֶ�
					{
						if (!(eval("formName."+fbTab[i]+"ch.checked"))){//�ҵ�
							return fbTab[i]+(parseInt(xh)+1);
						}
					}
					return "save";//ȫ���ֶα�ѡ������
				}
			}
		}
	}
	return "error";

}

function getNextField(formName,zbTab,objectName)
{
	var index=-1;
	for (var i=0; i<zbTab.length;i++ )//���ҵ�ǰ�����������е�λ��
	{
		if (zbTab[i]==objectName)//�ҵ�
		{
			index=i+1;
			if (zbTab.length>index)//�����������һ���ֶ�
			{
				if (eval("formName."+zbTab[index]+"ch.checked")){//��һ���ֶα�ѡ����������
					objectName=zbTab[index];
				}
				else{//��һ���ֶ�û�б�ѡ������
					return zbTab[index];//�����ֶ���
				}
			}
			else{//���������һ���ֶ�
				return "save";//���ش���
			}
		}
	}
}

function goNextField(formName,zbTab,objectName)
{
	var index=-1;
	for (var i=0; i<zbTab.length;i++ )//���ҵ�ǰ�����������е�λ��
	{
		if (zbTab[i]==objectName)//�ҵ�
		{
			index=i+1;
			if (zbTab.length>index)//�����������һ���ֶ�
			{
				if (eval("formName."+zbTab[index]+"ch.checked")){//��һ���ֶα�ѡ����������
					objectName=zbTab[index];
				}
				else{//��һ���ֶ�û�б�ѡ������
					eval("formName."+zbTab[index]+".select()");
					return zbTab[index];//�����ֶ���
				}
			}
			else{//���������һ���ֶ�
				return "save";//���ش���
			}
		}
	}
}

function nextField(formName,zbTab,objectName)
{
	var index=-1;
	for (var i=0; i<zbTab.length;i++ )//���ҵ�ǰ�����������е�λ��
	{
		if (zbTab[i]==objectName)//�ҵ�
		{
			index=i+1;
			if (zbTab.length>index)//�����������һ���ֶ�
			{
				return zbTab[index];//�����ֶ���
			}
			else{//���������һ���ֶ�
				return "save";//���ش���
			}
		}
	}
}


function getPrior(formName,zbTab,fbTab,rowNum,obName)
{
}

function selectItem(field1,field2,str)//�ϼ�,�¼�
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

function makeItem(field1,field2,str)//�ϼ�,�¼�
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

//���ַ���ת��Ϊ�����б����ݣ���%��+�ָ�
//��ͬ��%�ָͬһ���ã��ָ�
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

//���ַ���ת��Ϊ�����б����ݣ���%��+�ָ�
//��ͬ��%�ָͬһ���ã��ָ�
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

//���ַ���ת��Ϊ�����б����ݣ���^��~�ָ�
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

//���ַ���ת��Ϊ�����б����ݣ���^��~�ָ�
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


//���ַ���ת��Ϊ�����б����ݣ���%�ָ�п���
//��ͬ��%�ָ�
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


//���ַ���ת��Ϊ�����б����ݣ���%�ָ�޿���
//��ͬ��%�ָ�
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


//���س�������ת����fielName
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


//��Դ�������ݱ�ѡ��������ӵ�Ŀ���У���ɾ��Դ����
function addItem(fromField,toField)//����FormName:Form������
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
//��Դ�������ݱ�ѡ�������ƶ���Ŀ���У�ɾ��Դ����
function moveItem(fromField,toField)//����FormName:Form������
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

//ȫѡ
function selectAll(selectedField)//����FormName:Form������
{
	for(i=0;i<selectedField.length;i++){                                                                         
		selectedField.options[i].selected = true;                                                                         
	}                                                                        
}
//ȫ��ѡ
function notAll(selectedField)//����FormName:Form������
{
	for(i=0;i<selectedField.length;i++){                                                                         
		selectedField.options[i].selected = false;                                                                         
	}                                                                        
}
//ȫ��ѡ
function notRadio(selectedField)//����FormName:Form������
{
	for(i=0;i<selectedField.length;i++){                                                                         
		selectedField[i].checked = false;                                                                         
	}                                                                        
}

//��ѡ�����б���Ƿ�ѡ��
function selectChecked(selectedField)//����FormName:Form������
{
	for(i=0;i<selectedField.length;i++){                                                                         
		if (selectedField.options[i].selected && selectedField.options[i].value!="")
		{
			return true; 
		}
	}
	return false; 
}

//����Radio��ť�Ƿ�ѡ
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

//��ȡRadio��ť�Ǳ�ѡֵ
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

function getJg(f1,f2)//����FormName:Form������
{
	f2.value=f1.options[f1.selectedIndex].text.substring(f1.options[f1.selectedIndex].text.indexOf(":")+1);
}
function getSubStr(f1)//����FormName:Form������
{
	return f1.options[f1.selectedIndex].text.substring(f1.options[f1.selectedIndex].text.indexOf(":")+1);
}

function getItemValue(f1,f2)//����FormName:Form������
{
	f2.value=f1.options[f1.selectedIndex].value;
}

function replace(str,oldstr,newstr)//�滻�ַ���
{ 
	lstart=str.indexOf(oldstr);
	if (lstart!=-1)
	{
		str=str.substring(0,lstart)+newstr+str.substring(lstart+oldstr.length);
	}
	return str;
}

//�����Ƿ�Ϊʱ���ͣ�true����ȷ��false������
function isTime(FieldName,FieldNote)
{
	if (javaTrim(FieldName)==""){
		return true;
	}
	var regexp3=/^(\d{2}\:\d{2})$/;

	if (!(regexp3.test(FieldName.value)))
	{
		alert(FieldNote+"�������ʽ����ȷ,��ʽӦ��Ϊ��HH:MM�����磺12:34��");
		FieldName.select();
		return false;
	}
	

	var DateArray=new Array(2);
	DateArray=FieldName.value.split(":");
	
	if ((DateArray[1]<'00')||(parseInt(DateArray[1])>60))
	{
		alert(FieldNote+"������ķ��Ӳ���ȷ��"+DateArray[1]);
		FieldName.select();
		return false;
	}
	if ((DateArray[0]<'00')||(parseInt(DateArray[0])>24))
	{
		alert(FieldNote+"�������Сʱ����ȷ��");
		FieldName.select();
		return false;
	}
	return true;

}


//����С��λ��
//sz��Ҫ�������ֵ
//xs������С��λ��
//���ش�������ֵ
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

//����С��λ��
//sz��Ҫ�������ֵ
//xs������С��λ��
//���ش�������ֵ
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

function winOpen(Url,width,height,scrollbar,resize)//ʹ�����Ĵ��ھ���
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



//����dateStr��addInt��
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

//����dateStr��addInt��
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

//����dateStr��addInt��
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


//ȡ�ַ����е��Ӵ���ÿ���Ӵ���[valuei]��ʼ���磺��һ��Ϊ[value1]���ڶ���Ϊ[value2]
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


// �Ƿ��д��
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
			alert(FieldNote+"�����벻��ȷ�����а���Сд�ַ���"+str.charAt(i));
			FieldName.select();
			return false;
		}
	}
	return true;
}


// �Ƿ�Сд��
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
			alert(FieldNote+"�����벻��ȷ�����а�����д�ַ���"+str.charAt(i));
			FieldName.select();
			return false;
		}
	}
	return true;
}

//����ת��UTF8����>����
  function   utf8CodeToChineseChar(strUtf8)   
  {   
      var   iCode,   iCode1,   iCode2;   
      iCode   =   parseInt("0x"   +   strUtf8.substr(1,   2));   
      iCode1   =   parseInt("0x"   +   strUtf8.substr(4,   2));   
      iCode2   =   parseInt("0x"   +   strUtf8.substr(7,   2));   
        
      return   String.fromCharCode(((iCode & 0x0F) << 12) | ((iCode1 & 0x3F) << 6) | (iCode2 & 0x3F));   
  }   
    
  //   ��   UTF8   �����   URL   �е����Ĳ��֣�<   0xFFFF��ת������   
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
    

function days(date1,date2)//�滻�ַ���
{ 
	date1=replace(date1,"-","/");
	date2=replace(date2,"-","/");

	var num=(new Date(date1)-new Date(date2))/1000/60/60/24;

	return num;
}
