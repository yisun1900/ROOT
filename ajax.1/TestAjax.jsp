<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<head>
<title>���Ķ�����ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>



<body bgcolor="#FFFFFF" onload="selectform.inName.select()" style="FONT-SIZE:14" >

<form method="post" action="" name="selectform" target="_blank">


<table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCFF" style="FONT-SIZE:12;HEIGHT:26"> 
  <td > 
	��������<img src="/images/168.gif" > 
	
	<input type="text" name="inName" id="txt" size="50" maxlength="100" style='position:absolute; WIDTH:300;left:80; top:20; z-index:2' onKeyUp="changheIn(selectform);">
	
	<div style='position:absolute; WIDTH:300; left: 80; top:40; z-index:2' id='cen'> 
		<select name="xhlist" id="sel" style="FONT-SIZE:12px;WIDTH:100%;display:none" size="20" onKeyUp="changeItem(selectform,this)" onclick ="selectCk(selectform,this)">
		</select>
	</div>
  </td>
</tr>

	
</table>


</form>	

</body>
</html>




<SCRIPT language=javascript >
<!--

	//Ajax�Ļ��������������޸ģ�����������������������������������������ʼ
	function creatAjax() 
	{
	   if(window.XMLHttpRequest)
		{ 
			xmlHttp = new XMLHttpRequest();
		}
		else if (window.ActiveXObject)
		{
			try
			{
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch (e)
			{
				try
				{
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch (e)
				{
				}
			}
		}
	}

	function openAjax(actionStr) 
	{
		creatAjax();
		xmlHttp.onreadystatechange = responseAjax;
		xmlHttp.open("GET",actionStr, true);
	   xmlHttp.send(null);
	}

	function responseAjax() 
	{
		if (xmlHttp.readyState == 4)
		{	
			if(xmlHttp.status == 200)
			{
				var retStr = xmlHttp.responseText;
				getAjax(retStr);
			}
			else
			{	
				alert("����Ajax��Ӧʧ�ܣ�");
			}
		}
	}

	//Ajax�Ļ��������������޸ģ���������������������������������������������������

	var xhsz;
	var xhsz2;
	var len;

	var oldtext;

	var mark="";

	//��̬�ı��������λ�ã�ʹ�����־���
	function Alors()
	{
		document.getElementById("txt").style.left=80;
		document.getElementById("cen").style.left=document.getElementById("txt").style.left;
	}

	Time=window.setInterval("Alors()",10);

	//�����������ⵥ��ʱ����������ʧ
	document.onclick=function()
	{
		selectform.xhlist.style.display='none';
	}

	//����Ajax�ķ���ֵ������ֵ�Ǹ��ַ�����������ajaxRetStr��
	function getAjax(ajaxRetStr) 
	{
		//ȥ��ǰ��Ļ��з�
		while (true)
		{
			if (ajaxRetStr.substring(0,1)=="\r")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else if (ajaxRetStr.substring(0,1)=="\n")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else{
				break;
			}
		}

		//����������
		selectform.xhlist.length=0;//�������������

		if (ajaxRetStr!="")
		{
			xhsz=ajaxRetStr.split("^");
			len=xhsz.length;

			selectform.xhlist.style.display='block';//��ʾ������

			for(var i=0;i<len;i++)
			{
				selectform.xhlist.size=len;

				var pos=xhsz[i].indexOf("~");
				var lsvalue=xhsz[i].substring(0,pos);
				var lstext=xhsz[i].substring(pos+1,xhsz[i].length);

				var op1=document.createElement("option");
				op1.value=lsvalue;
				op1.text=lstext;
				selectform.xhlist.add(op1);
			}
		}
		else{
			selectform.xhlist.style.display='none';//����������
		}

	}

	//�����������¼���ݴ����¼�
	function changheIn(FormName)
	{   
//		alert(event.keyCode);
		
		//�����س�����
		if(event.keyCode==13)
		{
			selectform.xhlist.style.display='none';

		}
		//�����ϼ�ͷ����
		else if(event.keyCode==38)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[FormName.xhlist.length-1].selected=true;
			mark="last";

			oldtext=FormName.inName.value;

			FormName.inName.value=FormName.xhlist.options[FormName.xhlist.length-1].text;
		}
		//�����¼�ͷ����
		else if(event.keyCode==40)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[0].selected=true;
			mark="first";

			oldtext=FormName.inName.value;

			FormName.inName.value=FormName.xhlist.options[0].text;
		}
		//������������
		else{
			if(FormName.inName.value=="") 
			{
				selectform.xhlist.style.display='none';
				return;
			}

			//ִ��Ajax��ѯ
			actionStr="GetXhListByAjax.jsp?inName="+FormName.inName.value ;
	//		window.open(actionStr);
			openAjax(actionStr);  
		}

	}                                                                                                                                                       

	//�����򴥷��¼�
	function changeItem(FormName,field)
	{
		//�����ϼ�ͷ����
		if(event.keyCode==38)
		{
			if (mark=="last")
			{
				mark="";
			}

			FormName.inName.value=field.options[field.selectedIndex].text;

			if (field.selectedIndex==0)
			{
				if (mark=="first")
				{
					field.value="";
					mark="";

					FormName.inName.value=oldtext;

					FormName.inName.focus();
				}
				else{
					mark="first";
				}
			}
		}
		//�����¼�ͷ����
		else if(event.keyCode==40)
		{
			if (mark=="first")
			{
				mark="";
			}

			FormName.inName.value=field.options[field.selectedIndex].text;

			if (field.selectedIndex==field.length-1)
			{
				if (mark=="last")
				{
					field.value="";
					mark="";

					FormName.inName.value=oldtext
					FormName.inName.focus();
				}
				else{
					mark="last";
				}
			}
		}

		//�����س�����
		else if(event.keyCode==13)
		{
			selectform.xhlist.style.display='none';
		}
	}


	//��굥�������򴥷��¼�
	function selectCk(FormName,field)
	{
		selectform.xhlist.style.display='none';//����

		FormName.inName.value=field.options[field.selectedIndex].text;
	}




//-->
</SCRIPT>
