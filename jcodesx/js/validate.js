	// ���� VB �� Trim ����
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
		for(var i=0; i<len; i++) {
			if (!((str.charAt(i)>='0' && str.charAt(i)<='9')||(str.charAt(i)=='-'))) 
			{
				alert(FieldNote+"�����벻��ȷ���绰����ֻ�ܰ������ֺ�\��-\��");
//				FieldName.value=""
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



//�����Ƿ�Ϊʵ����true����ȷ��false������
	function isFloat(FieldName,FieldNote)
	{
		if (javaTrim(FieldName)==""){
			return true;
		}

		if (isNaN(parseFloat(FieldName.value))) 
		{
			alert(FieldNote+"������Ĳ�������,������");
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
			FieldName.focus();
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
			FieldName.focus();
			return false;
		}
		if ((DateArray[2]<'01')||(parseInt(DateArray[2])>31))
		{
			alert(FieldNote+"����������ڲ���ȷ��");
			FieldName.focus();
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

//���س�������ת����fielName
function keyGo(fielName)
{
	if (event.keyCode==13)	
	{
		fielName.select();
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

//����Radio��ť�Ƿ�ѡ��ʹ�ö�������ʹ�õ���
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
