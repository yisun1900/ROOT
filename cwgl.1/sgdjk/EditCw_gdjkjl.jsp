<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gdjkjlh=null;
String khbh=null;
String jklx=null;
String jkje=null;
String jkblr=null;
String jkblsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String wheregdjkjlh=cf.GB2Uni(request.getParameter("gdjkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String hth=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;
double qye=0;

double zjxje=0;
double kglf=0;
double kqtk=0;
double gckk=0;
double sfke=0;

int jkcs=0;


try {
	conn=cf.getConnection();
	ls_sql="select gdjkjlh,khbh,sgd,jklx,jkje,jkblr,jkblsj,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_gdjkjl";
	ls_sql+=" where  (gdjkjlh='"+wheregdjkjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gdjkjlh=cf.fillNull(rs.getString("gdjkjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		jklx=cf.fillNull(rs.getString("jklx"));
		jkje=cf.fillNull(rs.getString("jkje"));
		jkblr=cf.fillNull(rs.getString("jkblr"));
		jkblsj=cf.fillNull(rs.getDate("jkblsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select kglf,kqtk,gckk,zjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,zjxm,qye";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		gckk=rs.getDouble("gckk");
		zjxje=rs.getDouble("zjxje");
		sfke=rs.getDouble("sfke");
		qye=rs.getDouble("qye");

		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zjxm=cf.fillNull(rs.getString("zjxm"));

	}
	rs.close();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from  cw_gdjkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jkcs=rs.getInt(1);
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
if (jkcs>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">����¼��</td>
	<td  width="8%">�������</td>
	<td  width="7%">�����־</td>
	<td  width="7%">ʩ����</td>
	<td  width="11%">�����</td>
	<td  width="7%">������</td>
	<td  width="9%">����ʱ��</td>
	<td  width="42%">��ע</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT cw_gdjkjl.gdjkjlh, DECODE(cw_gdjkjl.jklx,'1','�����','2','���Ͽ�','9','����') as cw_gdjkjl_jklx,DECODE(cw_gdjkjl.gdjsjd,'0','δ����','1','����'),sgdmc,cw_gdjkjl.jkje as cw_gdjkjl_jkje,cw_gdjkjl.jkblr as cw_gdjkjl_jkblr,cw_gdjkjl.jkblsj as cw_gdjkjl_jkblsj,cw_gdjkjl.bz as cw_gdjkjl_bz  ";
	ls_sql+=" FROM crm_khxx,cw_gdjkjl,sq_sgd  ";
    ls_sql+=" where cw_gdjkjl.khbh=crm_khxx.khbh and cw_gdjkjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_gdjkjl.khbh='"+khbh+"' and cw_gdjkjl.czlx!='3' and cw_gdjkjl.scbz='N'";
    ls_sql+=" order by cw_gdjkjl.sgd,cw_gdjkjl.jklx,cw_gdjkjl.gdjkjlh";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"fkxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/cwgl/qyecx/ViewCw_khfkjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fkxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
}
%> 
</table>

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ������¼�ţ�<%=gdjkjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCw_gdjkjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">�ͻ����</td>
              <td width="29%"><%=khbh%></td>
              <td width="19%" align="right">��ͬ��</td>
              <td width="31%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="29%"> <%=khxm%>��<%=lxfs%>�� </td>
              <td width="19%"> 
                <div align="right">�ʼ�����</div>
              </td>
              <td width="31%"><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="29%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="19%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="31%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="29%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="19%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="31%"> <%=qyrq%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%"> 
                <div align="right">ǩԼ��</div>
              </td>
              <td width="29%"><%=qye%> </td>
              <td bgcolor="#CCCCFF" width="19%"> 
                <div align="right">�����������</div>
              </td>
              <td width="31%"><%=zjxje%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">�ۼƼ�������</td>
              <td width="29%"><%=kglf%></td>
              <td width="19%" align="right">�ۼƼ����������</td>
              <td width="31%"><%=kqtk%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">���̿ۿ�</td>
              <td width="29%"><%=gckk%></td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right" bgcolor="#CCFFCC" width="21%">����ʵ�տ���</td>
              <td width="29%"><%=(int)(sfke/(qye+zjxje+kglf+kqtk-gckk)*100+0.5)%>%</td>
              <td align="right" width="19%">����ʵ�տ��</td>
              <td width="31%"><%=cf.formatDouble(sfke)%>����Ƿ��<%=cf.formatDouble((qye+zjxje+kglf+kqtk-gckk)-sfke)%>����</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right"><font color="#990000">*</font>�������</div>
              </td>
              <td width="29%"> 
                <select name="jklx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+�����&2+���Ͽ�&3+���ڲ���&9+����",jklx);
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right"><font color="#990000">*</font>�����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jkje" size="20" maxlength="17"  value="<%=jkje%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right"><font color="#990000">*</font>��������</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jkblr" size="20" maxlength="20"  value="<%=jkblr%>" >
              </td>
              <td width="19%"> 
                <div align="right"><font color="#990000">*</font>������ʱ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jkblsj" size="20" maxlength="10"  value="<%=jkblsj%>" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">¼����</font></div>
              </td>
              <td width="29%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
              </td>
              <td width="19%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">¼��ʱ��</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="hidden" name="wheregdjkjlh"  value="<%=wheregdjkjlh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                  <input name="button" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="�տ���Ϣ">
                </div>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jklx)=="") {
		alert("��ѡ��[�������]��");
		FormName.jklx.focus();
		return false;
	}
	if(	javaTrim(FormName.jkje)=="") {
		alert("������[�����]��");
		FormName.jkje.focus();
		return false;
	}
	if(!(isFloat(FormName.jkje, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jkblr)=="") {
		alert("������[��������]��");
		FormName.jkblr.focus();
		return false;
	}
	if(	javaTrim(FormName.jkblsj)=="") {
		alert("������[������ʱ��]��");
		FormName.jkblsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jkblsj, "������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
