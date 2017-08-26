<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String czxh=cf.GB2Uni(request.getParameter("czxh"));
String whereclbm=null;
whereclbm=cf.GB2Uni(request.getParameter("clbm"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String clbm=null;
String clmc=null;
String clgg=null;
String lrjsfs=null;
String lrjsfs2=null;
double lrbfb=0;
String bz=null;
double cj=0;
double cjjsj=0;
double fgsdj=0;
double gdj=0;
String jldwmc=null;
String cldlmc=null;
String ckmc=null;
String sfrk=null;
double qybfb=0;
double khqye=0;
double ylqje=0;
double sjje=0;
double sumrk=0;
double sumck=0;
double kcsl=0;
try {
	conn=cf.getConnection();

	//��ѯ���++++++++++++++++++++++++++++++++++++++++++++++++

	//��ѯ�����ڽ�ת���ڡ����ڿ������
	java.sql.Date sqjzrq=null;
	ls_sql="select max(jzrq)";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+ssfgs+"' ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzrq=rs.getDate(1);
	} 
	rs.close();
	ps.close();

	String sqjzph=null;
	ls_sql="select jzph";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+ssfgs+"' and jzrq=?";
	ps=conn.prepareStatement(ls_sql);  
	ps.setDate(1,sqjzrq);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzph=rs.getString(1);
	} 
	rs.close();
	ps.close();

	double sqkcsl=0;
	ls_sql="select cl_ydjzmx.kcsl ";
	ls_sql+=" from cl_ydjzmx,cl_ydjz ";
	ls_sql+=" where cl_ydjzmx.jzph=cl_ydjz.jzph and cl_ydjz.dwbh='"+ssfgs+"' and cl_ydjzmx.jzph='"+sqjzph+"' and cl_ydjzmx.clbm='"+whereclbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqkcsl=rs.getDouble("kcsl");
	}
	rs.close();
	ps.close();

	
	ls_sql="select nvl(sum(rksl),0)  ";
	ls_sql+=" from cl_rkmx,cl_rkd  ";
	ls_sql+=" where cl_rkd.rkph=cl_rkmx.rkph  ";
	ls_sql+=" and cl_rkd.dwbh='"+ssfgs+"'  ";
	ls_sql+=" and clbm='"+whereclbm+"' ";
	ls_sql+=" and cl_rkd.rkzt='2' and rksj>?";//ע����㲻��������
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqjzrq);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sumrk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select nvl(sum(cksl),0)  ";
	ls_sql+=" from cl_ckmx,cl_ckd  ";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph  ";
	ls_sql+=" and cl_ckd.dwbh='"+ssfgs+"' ";
	ls_sql+=" and cl_ckmx.clbm='"+whereclbm+"' and cl_ckmx.leixing='1' ";
	ls_sql+=" and cl_ckd.ckzt='2' and cksj>?";//ע����㲻��������
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqjzrq);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sumck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	kcsl=cf.doubleTrim(sqkcsl+sumrk-sumck);

	//��ѯ���----------------------------------------------------

	ls_sql="SELECT ckmc,sfrk,cl_clbm.clbm clbm,clmc,clgg,cj,cjjsj,fgsdj,gdj,jldwmc,DECODE(lrjsfs,'1','��۷�ʽ','2','�ٷֱȷ�ʽ') lrjsfs,lrjsfs lrjsfs2,lrbfb,bz,cl_clbm.cldlmc ";
	ls_sql+=" FROM cl_clbm,cl_jgmx "; 
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm  ";
	ls_sql+="  and  (cl_clbm.clbm='"+whereclbm+"') and cl_jgmx.dwbh='"+ssfgs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ckmc=cf.fillNull(rs.getString("ckmc"));
		sfrk=cf.fillNull(rs.getString("sfrk"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		lrjsfs=cf.fillNull(rs.getString("lrjsfs"));
		lrjsfs2=cf.fillNull(rs.getString("lrjsfs2"));
		lrbfb=rs.getDouble("lrbfb");
		bz=cf.fillNull(rs.getString("bz"));
		cj=rs.getDouble("cj");
		cjjsj=rs.getDouble("cjjsj");
		fgsdj=rs.getDouble("fgsdj");
		gdj=rs.getDouble("gdj");
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT cl_djjflmx.qybfb,cl_djjflmx.ylqje,cl_djjflmx.sjje";
	ls_sql+=" from cl_djjflmx"; 
    ls_sql+=" where cl_djjflmx.cldlmc='"+cldlmc+"' and cl_djjflmx.khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qybfb=rs.getDouble(1);
		ylqje=rs.getDouble(2);
		sjje=rs.getDouble(3);
	}
	rs.close();
	ps.close();


/****************************************************************
|					��ѯ�ͻ�ǩԼ��								|
****************************************************************/
	ls_sql=" select qye from cl_djj where czxh='"+czxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
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
<title>¼����Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> ������ϸ��������ţ�<%=czxh%>�� <font color="blue">�������<%=cf.formatDouble(kcsl)%>&nbsp;<%=jldwmc%>��</font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">���ϱ���</div>
    </td>
    <td width="33%"> <%=clbm%>&nbsp;</td>
    <td width="17%"> 
      <div align="right">��������</div>
    </td>
    <td width="33%"><%=clmc%>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">���Ϲ��</div>
    </td>
    <td width="33%"><%=clgg%>&nbsp;</td>
    <td width="17%"> 
      <div align="right">���ϵ���</div>
    </td>
    <td width="33%"> <%=gdj%>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">������λ</div>
    </td>
    <td width="33%"><%=jldwmc%>&nbsp;</td>
    <td width="17%"> 
      <div align="right">�ֿ�����</div>
    </td>
    <td width="33%"><%=ckmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">��ע</div>
    </td>
    <td colspan="3"><%=bz%> </td>
  </tr>
</table>
<div align="center"> �ͻ���ţ���<%=khbh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">���ϴ���</td>
    <td width="33%"><%=cldlmc%></td>
    <td width="17%" align="right">&nbsp;</td>
    <td width="33%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">����ǩԼ��</td>
    <td width="33%"><%=khqye%>Ԫ</td>
    <td width="17%" align="right">ǩԼ�ٷֱ�</td>
    <td width="33%"><%=qybfb%>%&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="17%" align="right">����Ӧ��ȡ���</td>
    <td width="33%"><font color="blue"><%=ylqje%>Ԫ</font></td>
    <td width="17%" align="right">�ۼ���ȡ���</td>
    <td width="33%"><font color="blue"><%=sjje%>Ԫ</font> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">���</div>
    </td>
    <td width="33%"><font color="blue"><%=cf.formatDouble(ylqje-sjje)%>Ԫ</font></td>
    <td width="17%"> 
      <div align="right">ʵ��ȡ����</div>
    </td>
    <td width="33%"><%=cf.formatDouble(sjje*100.0/ylqje)%>��</td>
  </tr>
</table>
<center>
  <DIV> </DIV>
</center>
<div align="center">
<form method="post" action="SaveInsertCl_djjmx.jsp" name="insertform">
			
    <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF"> 
        <td width="17%"> 
          <div align="right"><font color="red">������ȡ����</font></div>
        </td>
        <td width="33%" > 
          <input type="text" name="sqlqsl" value="" size="20" maxlength="20"  onKeyup="sl(insertform);">
        <td width="17%"> 
          <div align="right"><font color="red">���Ӽ�</font></div>
        </td>
        <td width="33%" > 
          <input type="text" name="gdj" value="<%=gdj%>" size="20" maxlength="20"  onKeyUp="dj(insertform);" readonly>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="17%"> 
          <div align="right"><font color="red">������ȡ���</font></div>
        </td>
        <td width="33%" > 
          <input type="text" name="sqlqje" value="" size="20" maxlength="20" readonly>
        <td width="17%"> 
          <div align="right"></div>
        </td>
        <td width="33%" >&nbsp; </td>
      </tr>
      <tr align="center"> 
        <td colspan="4"> 
          <input type="button"  value="����" onClick="f_do(insertform)">
          <input type="reset"  value="����" name="reset">
          <input type="hidden" name="czxh" value="<%=czxh%>"  >
          <input type="hidden" name="clbm" value="<%=clbm%>"  >
          <input type="hidden" name="clmc" value="<%=clmc%>"  >
          <input type="hidden" name="clgg" value="<%=clgg%>"  >
          <input type="hidden" name="cldlmc" value="<%=cldlmc%>"  >
          <input type="hidden" name="jldwmc" value="<%=jldwmc%>"  >
          <input type="hidden" name="cj" value="<%=cj%>"  >
          <input type="hidden" name="cjjsj" value="<%=cjjsj%>"  >
          <input type="hidden" name="fgsdj" value="<%=fgsdj%>"  >

          <input type="hidden" name="ckmc" value="<%=ckmc%>"  >
          <input type="hidden" name="sfrk" value="<%=sfrk%>"  >
        </td>
      </tr>
    </table>
		</form>
	</div>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function sl(FormName)
{	
	if (FormName.gdj.value!="")
	{
		FormName.sqlqje.value=formatDouble(FormName.sqlqsl.value*FormName.gdj.value,2);
		if (!(isFloat(FormName.sqlqje,""))){
			FormName.sqlqje.value="";
			FormName.sqlqsl.value="";
			FormName.sqlqsl.focus();
			return      
	   } 
	}       
}
function dj(FormName)
{	
	if (FormName.sqlqsl.value!="")
	{
		FormName.sqlqje.value=formatDouble(FormName.sqlqsl.value*FormName.gdj.value,2);
		if (!(isFloat(FormName.sqlqje,""))){
			FormName.sqlqje.value="";
			FormName.gdj.value="";
			FormName.gdj.focus();
			return      
	   } 
	}       
}
function f_do(FormName)//����FormName:Form������
{
	var dj=FormName.gdj.value-0;

	if (dj==0)
	{
		alert("���ļ۸�δ��,�뵽[���ϱ����--> ���ļ۸����]�����۸�!!!");
		return false;
	}
	if(	javaTrim(FormName.sqlqsl)=="") {
		alert("������[������ȡ����]��");
		FormName.sqlqsl.focus();
		return false;
	}
	if (!(isFloat(FormName.sqlqsl,"������ȡ����"))){
		FormName.sqlqsl.focus();     
		return      
	   }
	if(	javaTrim(FormName.gdj)=="") {
		alert("������[���Ӽ�]��");
		FormName.gdj.focus();
		return false;
	}
	if (!(isFloat(FormName.gdj,"���Ӽ�"))){
		FormName.gdj.focus();     
		return      
	   }
	if(	javaTrim(FormName.sqlqje)=="") {
		alert("������[������ȡ���]��");
		FormName.sqlqje.focus();
		return false;
	}
	if (!(isFloat(FormName.sqlqje,"������ȡ���"))){
		FormName.sqlqje.focus();     
		return      
	}

	lrsl=FormName.sqlqsl.value-0;
	cdj=FormName.gdj.value-0;
	cje=FormName.sqlqje.value-0;
	if (lrsl<0)
	{
		alert("��������ȡ����������С���㣡����");
		FormName.sqlqsl.focus();
		return false;
	}


	if (cdj<=0)
	{
		alert("�����Ӽۡ���������㣡����");
		FormName.gdj.focus();
		return false;
	}
	if (cje<0)
	{
		alert("��������ȡ������С���㣡����");
		FormName.sqlqsl.focus();
		return false;
	}

	FormName.submit();
	return true;

}
//-->
</SCRIPT>