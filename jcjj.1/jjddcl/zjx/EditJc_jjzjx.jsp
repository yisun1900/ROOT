<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");


String ddbh=null;
String zjxyybm=null;
String jhazsj=null;
String zjxlrr=null;
String zjxlrsj=null;
String zjxbz=null;
String zjxfssj=null;

String khbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String kgrq=null;
String jgrq=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String qyrq=null;
String qydm=null;
String ssfgs=null;
String cxhdbm=null;

String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh=null;


String clgw=null;
String ztjjgw=null;
String xmzy=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
double jjje=0;
double xcmje=0;
double htze=0;

double jjzjje=0;
double xcmzjje=0;
double zjhze=0;
String qhtr=null;
String qhtsj=null;
String jhazrq=null;
String kjxsj=null;
String htbz=null;
String clztmc=null;

String fkje=null;
String sqdj="";

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;

try {
	conn=cf.getConnection();

	ls_sql="select ddbh,zjxyybm,jhazsj,lrr,lrsj,bz,zjxfssj ";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zjxyybm=cf.fillNull(rs.getString("zjxyybm"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		zjxlrr=cf.fillNull(rs.getString("lrr"));
		zjxlrsj=cf.fillNull(rs.getDate("lrsj"));
		zjxbz=cf.fillNull(rs.getString("bz"));
		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
	}
	rs.close();
	ps.close();

	ls_sql="select jc_jjdd.khbh,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.kgrq,crm_khxx.jgrq,crm_khxx.sgd,crm_khxx.sgbz,crm_khxx.zjxm,crm_khxx.qyrq,crm_khxx.dwbh,cxhdbm,jc_jjdd.fgsbh";
	ls_sql+=" ,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.lrr,jc_jjdd.lrsj,jc_jjdd.bz,dwmc,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.htze";
	ls_sql+=" ,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.zjhze,jc_jjdd.qhtr,jc_jjdd.qhtsj,jc_jjdd.jhazrq,jc_jjdd.kjxsj,jc_jjdd.htbz,clztmc";
	ls_sql+=" from  crm_khxx,jc_jjdd,sq_dwxx,jdm_jjddzt";
	ls_sql+=" where jc_jjdd.dwbh=sq_dwxx.dwbh and jc_jjdd.khbh=crm_khxx.khbh(+) and  (jc_jjdd.ddbh='"+ddbh+"')  ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qydm=cf.fillNull(rs.getString("dwbh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));

		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
		bz=cf.fillNull(rs.getString("bz"));
		jjje=rs.getDouble("jjje");
		xcmje=rs.getDouble("xcmje");
		htze=rs.getDouble("htze");

		jjzjje=rs.getDouble("jjzjje");
		xcmzjje=rs.getDouble("xcmzjje");
		zjhze=rs.getDouble("zjhze");
		qhtr=cf.fillNull(rs.getString("qhtr"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		htbz=cf.fillNull(rs.getString("htbz"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+qydm+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">�޸ļҾ��������������ţ�<%=zjxxh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">�ͻ����</td>
      <td width="29%"><%=khbh%></td>
      <td width="19%" align="right">��ͬ��</td>
      <td width="31%"><%=hth%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">�ͻ�����</td>
      <td width="29%"><%=khxm%>��<%=lxfs%>�� </td>
      <td width="19%" align="right">�μӴ����</td>
      <td width="31%"><%=cxhdbm%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">���ݵ�ַ</td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right" bgcolor="#CCCCFF">ǩԼ����</td>
      <td width="29%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qydm+"'",qydm,true);
%></td>
      <td width="19%" align="right">��װ���ʦ</td>
      <td width="31%"><%=sjs%>��<%=sjsdh%>��</td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">ʩ����</td>
      <td width="29%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> ��<%=dzdh%>�� </td>
      <td width="19%" align="right">�೤</td>
      <td width="31%"><%=sgbz%>��<%=bzdh%>�� </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">��װǩԼ����</td>
      <td width="29%"><%=qyrq%> </td>
      <td width="19%" align="right">�ʼ�</td>
      <td width="31%"><%=zjxm%>��<%=zjdh%>�� </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">��ͬ��������</td>
      <td width="29%"><%=kgrq%> </td>
      <td width="19%" align="right">��ͬ��������</td>
      <td width="31%"><%=jgrq%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right">��ĿרԱ</td>
      <td><%=xmzy%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right">פ��Ҿӹ���</td>
      <td><%=clgw%> </td>
      <td align="right">չ���Ҿӹ���</td>
      <td><%=ztjjgw%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right" bgcolor="#CCFFCC">¼����</td>
      <td><%=lrr%> </td>
      <td align="right">¼��ʱ��</td>
      <td><%=lrsj%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right">¼�벿��</td>
      <td><%=lrbm%></td>
      <td align="right"></td>
      <td></td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right">��ע</td>
      <td colspan="3"><%=bz%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right">�Ҿߺ�ͬ���</td>
      <td><%=jjje %></td>
      <td align="right">�Ҿ���������</td>
      <td><%=jjzjje%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right">�Ͳ��ź�ͬ���</td>
      <td><%=xcmje %></td>
      <td align="right">�Ͳ�����������</td>
      <td><%=xcmzjje%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right">��ͬ�ܶ�</td>
      <td><%=htze%></td>
      <td align="right">�������ܶ�</td>
      <td><%=zjhze%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right"> ǩ��ͬʱ��</td>
      <td><%=qhtsj%></td>
      <td align="right">ǩ��ͬ��</td>
      <td><%=qhtr%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right">�ƻ���װ����</td>
      <td><%=jhazrq%></td>
      <td align="right">�ɼ����ֹʱ��</td>
      <td><%=kjxsj%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right" bgcolor="#CCCCFF">��ͬ��ע</td>
      <td colspan="3"><%=htbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0033">*</font>������ԭ��</td>
      <td width="31%"> 
        <select name="zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmzjxyybm,mmzjxyymc from jdm_mmzjxyybm order by mmzjxyybm",zjxyybm);
%> 
        </select>
      </td>
      <td align="right" width="17%">�ƻ���װʱ��</td>
      <td width="33%"> 
        <input type="text" name="jhazsj" size="20" maxlength="10"  value="<%=jhazsj%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="19%"><font color="#FF0000">*</font>�������ʱ��</td>
      <td width="31%">
        <input type="text" name="zjxfssj" value="<%=zjxfssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0033">*</font><font color="#0000FF">¼����</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=zjxlrr%>" readonly>
      </td>
      <td align="right" width="17%"><font color="#FF0033">*</font><font color="#0000FF">¼��ʱ��</font></td>
      <td width="33%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=zjxlrsj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="2"><%=zjxbz%></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4" >
        
        <table width="100%" border="0">
          <tr>
            <td colspan="3" align="center"><input type="hidden" name="zjxxh" value="<%=zjxxh%>" size="20" >
              <input type="hidden" name="ddbh" value="<%=ddbh%>" size="20" >
              <input type="hidden" name="khbh" value="<%=khbh%>" size="20" >
              <input name="button" type="button" onClick="f_do(insertform)"  value="����">
              <input type="reset"  value="����" name="reset">
              <input type="button"  value="���" onClick="f_end(insertform)" name="wc" ></td>
          </tr>
          <tr>
            <td width="40%" align="right"><input type="button"  value="�������--" onClick="f_gtjx(insertform)" name="gtjx" ></td>
            <td width="20%" align="center"><input type="button"  value="��������++" onClick="f_gtzx(insertform)" name="gtzx" ></td>
            <td width="40%"><input type="button"  value="����--������ϸ" onClick="f_gtmx(insertform)" name="gtmx" ></td>
          </tr>
          <tr>
            <td align="right"><input type="button"  value="�Ͳ��ż���" onClick="f_xcmjx(insertform)" name="xcmjx" ></td>
            <td align="center"><input type="button"  value="�Ͳ�������" onClick="f_xcmzx(insertform)" name="xcmzx" ></td>
            <td><input type="button"  value="�Ͳ���������ϸ" onClick="f_xcmmx(insertform)" name="xcmmx" ></td>
          </tr>
          <tr>
            <td align="right"><input type="button"  value="��Ʒ�Ҿ�--����������" onClick="f_cpjjjx(insertform)" name="cpjjjx" ></td>
            <td align="center"><input type="button"  value="��Ʒ�Ҿ�--��������" onClick="f_cpjjzx(insertform)" name="cpjjzx" ></td>
            <td><input type="button"  value="��Ʒ�Ҿ�--��������ϸ" onClick="f_cpjjmx(insertform)" name="cpjjmx" ></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.zjxyybm)=="") {
		alert("��ѡ��[������ԭ��]��");
		FormName.zjxyybm.focus();
		return false;
	}

	if(!(isDatetime(FormName.jhazsj, "�ƻ���װʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.zjxfssj)=="") {
		alert("������[�������ʱ��]��");
		FormName.zjxfssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj, "�������ʱ��"))) {
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

	FormName.action="SaveEditJc_jjzjx.jsp";
	FormName.submit();
	return true;
}
function f_end(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}
	FormName.action="EndJc_jjzjx.jsp";
	FormName.submit();
	return true;
}


function f_gtjx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	
	FormName.action="Jc_jjgtmxJxList.jsp";
	FormName.submit();
	return true;
}
function f_gtzx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="InsertJc_jjgtmx.jsp";
	FormName.submit();
	return true;
}
function f_gtmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="Jc_jjgtZjxList.jsp";
	FormName.submit();
	return true;
}

function f_xcmjx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	
	FormName.action="Jc_jjxcmmxJxList.jsp";
	FormName.submit();
	return true;
}
function f_xcmzx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="InsertJc_jjxcmmxMain.jsp";
	FormName.submit();
	return true;
}
function f_xcmmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="Jc_jjxcmZjxList.jsp";
	FormName.submit();
	return true;
}

function f_cpjjjx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	
	FormName.action="Jc_cpjjddmxJxList.jsp";
	FormName.submit();
	return true;
}
function f_cpjjzx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="InsertJc_cpjjddmxMain.jsp";
	FormName.submit();
	return true;
}
function f_cpjjmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="Jc_cpjjZjxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
