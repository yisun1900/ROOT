<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");


//����Ƿ�����ĩ��ת
//���أ� -1:����;0:��ȫ����ת��1:ֻ�����һ��δ��ת;2:�����������δ��ת
int count=cf.checkYjQmjz("cw_qmjz");

if (count==1)
{
	out.println("�������һ��δ��ת��");
	return;
}
else if (count==2)
{
	out.println("�����������δ��ת��");
	return;
}
else if (count==-1)
{
	out.println("����");
	return;
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ǩ���ͻ�--ά��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">�ֹ�˾</div>
              </td>
              <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="17%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="buildSelect(this.value, 'selB')">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >
              </td>
              <td width="16%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="34%"> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >
              </td>
              <td width="16%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="34%">
                <input type="text" name="khxm2" size="10" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��������</div>
              </td>
              <td width="33%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="34%"> 
                <input type="text" name="sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">���ݵ�ַ</td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="72" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">С��/�ֵ�</div>
              </td>
              <td width="33%"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" >
              </td>
              <td width="16%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="34%"> 
                <select name="zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="2">ǩԼ�ͻ�</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ϵ��ʽ</td>
              <td width="33%">
                <input type="text" name="lxfs" size="20" maxlength="50" >
              </td>
              <td width="16%" align="right">�ɵ�״̬</td>
              <td width="34%"> 
                <select name="pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">�����ɵ�</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��Ϣ¼����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" size="20" maxlength="20" >
              </td>
              <td width="16%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="34%"> 
                <input type="radio" name="kgsjqd" value="Y">
                ��ȷ�� 
                <input type="radio" name="kgsjqd" value="N">
                δȷ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ǩԼ���� ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="qyrq" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">��</div>
              </td>
              <td width="34%"> 
                <input type="text" name="qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">¼��ʱ�� ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">��&nbsp;</div>
              </td>
              <td width="34%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

var xmlHttp;        //���ڱ���XMLHttpRequest�����ȫ�ֱ���

//���ڴ���XMLHttpRequest����
function createXmlHttp() 
{
    //����window.XMLHttpRequest�����Ƿ����ʹ�ò�ͬ�Ĵ�����ʽ
    if(window.XMLHttpRequest)
		{ //Mozilla �����
			xmlHttp = new XMLHttpRequest();
		}
		else if (window.ActiveXObject)
		{
			// IE�����
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



//��ȡ�б�ѡ��ĵ��ú���
function buildSelect(selectedId, targetId) {
    if (selectedId == "") {                             //selectedIdΪ�մ���ʾѡ����Ĭ����
		clearSubSel(targetId);                          //���Ŀ���б��¼��б��е�ѡ��
        return;                                         //ֱ�ӽ����������ã������������������Ϣ
    }
    targetSelId = targetId;                             //�������Ŀ���б�id��ֵ��targetSelId����
	
	createXmlHttp();                                    //����XmlHttpRequest����
	xmlHttp.onreadystatechange = buildSelectCallBack;   //���ûص�����
	xmlHttp.open("GET", "select_menu.jsp?selectedId=" + selectedId, true);
    xmlHttp.send(null);

}



//��ȡ�б�ѡ��Ļص�����
function buildSelectCallBack() {
    //alert("�ص�");
    if (xmlHttp.readyState == 4) 
	{	//alert("��Ӧ�Ѿ�ȫ���õ�");
		//alert(xmlHttp.status);
		if(xmlHttp.status == 200){
			var optionsInfo = xmlHttp.responseText.split(",");			//������������ת��Ϊ����
			var targetSelNode = document.getElementById(targetSelId);
			clearSubSel(targetSelId);                                    //���Ŀ���б��е�ѡ��
			//��������ֱ�����еĳ�Ա
			for(var i=0;i<optionsInfo.length;i++){
				//alert(optionsInfo[i]);
				getString=optionsInfo[i].split(":");
				//alert(getString[0]);
				//alert(getString[1]);
				targetSelNode.appendChild(createOption(getString[0], getString[1])); //��Ŀ���б�׷���µ�ѡ��
			}
		}
		else
		{	
			alert("��Ӧʧ�ܣ�");
		}
    }
}







function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
