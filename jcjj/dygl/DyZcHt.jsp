<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���ĺ�ͬ��ӡ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ddbh=request.getParameter("ddbh");
	String khbh=cf.executeQuery("select khbh from jc_zcdd where ddbh='"+ddbh+"'");
	String clzt=cf.executeQuery("select clzt from jc_zcdd where ddbh='"+ddbh+"'");
	String xclbz=cf.executeQuery("select xclbz from jc_zcdd where ddbh='"+ddbh+"'");
	String sxhtsfysh=cf.executeQuery("select sxhtsfysh from jc_zcdd where ddbh='"+ddbh+"'");

%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target="_blank">
  <table width="100%">
    <tr> 
      <td colspan="2" height="74"> 
        <div align="center">���ĺ�ͬ��ӡ(Ԥ������ţ�<%=ddbh%>)</div>
      </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <div align="center"> 
          <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="button" value="��ӡԤ����" onClick="f_do(selectform,'dydd')">
          <input type="button" value="��ӡ����������ͬ" onClick="f_do(selectform,'dydldxht')">
          <input type="button" value="��ӡ����" onClick="f_do(selectform,'dymx')">
          <input type="button" value="��ӡ������" onClick="f_do(selectform,'dycld')">
		   <input type="button" value="��ӡ�˵�����Ӧ��" onClick="f_do(selectform,'tddy')">
        </div>
      </td>
    </tr>
  </table>
</form>

<form method="POST" name="listform">
<table border="1" width="220%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">�������</td>
	<td  width="4%">����״̬</td>
	<td  width="5%">���Ĵ���</td>
	<td  width="5%">����С��</td>
	<td  width="6%">Ʒ�ƹ�Ӧ��</td>
	<td  width="5%">Ʒ��</td>
	<td  width="5%">��Ӧ��</td>
	<td  width="4%">��ͬ�ܶ�</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">פ��Ҿӹ���</td>
	<td  width="3%">չ���Ҿӹ���</td>
	<td  width="3%">��ĿרԱ</td>
	<td  width="3%">�Ҿ����ʦ</td>
	<td  width="4%">�ͻ���������</td>
	<td  width="5%">����ص�</td>
	<td  width="4%">�ȴ��ͻ�֪ͨ</td>
	<td  width="4%">��Ʒ����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="8%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT jc_zcdd.ddbh,clztmc,zcdlbm,zcxlbm,jc_zcdd.ppbm,jc_zcdd.ppmc,jc_zcdd.gys,jc_zcdd.hkze,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs, DECODE(jc_zcdd.jkxz,'1','δ����','2','ȫ��','3','�����������','4','Ԥ�������','5','�˻������'), DECODE(jc_zcdd.jkdd,'1','�������ֳ������','2','�����տ�','3','��˾�����տ�'), DECODE(jc_zcdd.ddshbz,'1','�������','2','����δ֪ͨ','3','������֪ͨ'),DECODE(jc_zcdd.xclbz,'1','�Ƕ��Ʋ�Ʒ','2','����ʽ��Ʒ'),jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,jdm_zcddzt ";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=a.dwbh";
 	if (yhjs.equals("G0") )
	{
		ls_sql+=" and jc_zcdd.clzt>='13' and jc_zcdd.clzt!='98'";
	}
	else{
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
	}
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
    ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";
    ls_sql+=" order by jc_zcdd.lrsj,jc_zcdd.ddbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_zcddList.jsp","SelectJc_zcdd.jsp","","");
//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//���ð�ť����
	String[] buttonName={"�ϲ���ӡ����"};//��ť����ʾ����
	String[] buttonLink={"zcfjhb.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
	pageObj.displayFoot();
%>
	  
	  

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	pageObj.printScript();
%> 

function f_do(FormName,lx)//����FormName:Form������
{

	if (lx=="dydldxht")
	{
		FormName.action="dydldxht.jsp";
	}
	else if (lx=="dymx")
	{
		FormName.action="zcfj.jsp";
	}
	else if (lx=="dycld")
	{
		FormName.action="dycld.jsp";
	}
	else if (lx=="tddy")
	{
		FormName.action="tddy.jsp";
	}
	else
	{
		FormName.action="zcydddy.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
