<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");
String skdw=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
int count=0;

String khxm="";
String fwdz="";
String lxfs="";
String sjs="";
String qye="";
String hth="";
String dwbh="";
String sgd="";
String zjxm="";
String qyrq="";
String zt="";

String sjsbh=null;
String fgsbh=null;
String sjfkzc=null;
String dsksjbz="";
double glf=0;
double sjf=0;

String cxhdbm="";
String sffj="";
double fjje=0;
double gsfje=0;
String sfyrz="";
String rzsc="";
String sfyyh="";
String yhyy="";

String zcmmbz="";//�����տ���
String mmbz="";//ľ���տ���
String cgjjbz="";//�����տ���
String jjbz="";//�Ҿ��տ���


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String fkxh="";
try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,sjs,zxdm,ssfgs,sjsbh,sjfkzc,cxhdbm,DECODE(zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') zt";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt="��ѯ�ͻ���"+cf.fillNull(rs.getString("zt"))+"��";
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		fgsbh=cf.fillNull(rs.getString("ssfgs"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
	}
	rs.close();
	ps.close();


	if (fgsbh.equals(""))
	{
		out.println("<font color=\"#FF0000\">���������ֹ�˾Ϊ��</font>");
		return;
	}
	if (dwbh.equals(""))
	{
		out.println("<font color=\"#FF0000\">������������Ϊ��</font>");
		return;
	}





		%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">�������</td>
		<td  width="9%">����״̬</td>
		<td  width="14%">Ʒ��</td>
		<td  width="6%">���Ϲ���</td>

		<td  width="6%">��ĿרԱ</td>
		<td  width="9%">��ͬ�ܶ�</td>
		<td  width="9%">��������</td>
		<td  width="9%">¼��ʱ��</td>
		<td  width="6%">¼����</td>
		<td  width="16%">��ע</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,ppbm,jc_zcdd.clgw,jc_zcdd.xmzy,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.lrsj,jc_zcdd.lrr,jc_zcdd.bz";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt";
		ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDate();
		//������ʾ��
	String[] disColName={"clgw"};
	pageObj.setDisColName(disColName);

	%>
	</table>
		<%


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}



%> 
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">�����Ķ�����һ���ͻ�����ת����һ���ͻ�����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF">
              <td height="47" colspan="4" align="center">ת���ͻ���Ϣ</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">�ͻ����</td>
              <td width="31%"><%=khbh%></td>
              <td width="19%" align="right">��ͬ��</td>
              <td width="31%"><%=hth%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"> 
                �ͻ�����              </td>
              <td width="31%"> <%=khxm%>��<%=lxfs%>�� </td>
              <td width="19%" align="right">���ʦ</td>
              <td width="31%"><%=sjs%>��<%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);%>��</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"> 
                ���ݵ�ַ              </td>
              <td width="31%"><%=fwdz%> </td>
              <td width="19%" align="right"> 
                �ͻ�����              </td>
              <td width="31%"><%=zt%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td height="45" colspan="4" align="center">ת��ͻ���Ϣ</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�ֹ�˾</td>
              <td>
				<select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
			  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%>
				</select>
				</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>ת��ͻ����</td>
              <td width="31%"> 
                <input type="text" name="khbh" value="" size="20" maxlength="7" >              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>ת��ͻ����� </td>
              <td width="31%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"><input type="hidden" name="khbh2"  value="<%=khbh%>" >
              <input type="button" name="bc" value="��ʼת��" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                <input type="button" value="�鿴�տ���Ϣ" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')"  ></td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_do(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ������?") )	
	{
		if(	javaTrim(FormName.fgsbh)=="") {
			alert("������[�ֹ�˾]��");
			FormName.fgsbh.focus();
			return false;
		}
		if(	javaTrim(FormName.khbh)=="") {
			alert("������[ת��ͻ����]��");
			FormName.khbh.focus();
			return false;
		}
		if(	javaTrim(FormName.khxm)=="") {
			alert("������[ת��ͻ�����]��");
			FormName.khxm.focus();
			return false;
		}
		if(	FormName.khbh.value==FormName.khbh2.value) {
			alert("����ת�롢ת���ͻ�������ͬ");
			FormName.khbh.focus();
			return false;
		}

		FormName.action="SaveDdzyJc_zcdd.jsp";
		FormName.submit();
		return true;
	}
}

//-->
</SCRIPT>
