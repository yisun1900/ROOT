<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sqrq=null;
String sqr=null;
String sqrlxdh=null;
String sfxtp=null;
String jhjdrq=null;
String jhjdsj=null;
String sqsm=null;
String zcwcsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));


String ssfgs=null;
String cqbm=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String dmjl="";
String dmjldh="";
String xcjdbz="";
String khqdzt="";
int sjhtje=0;
int tchtje=0;

String sgdStr=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,sqrq,sqr,sqrlxdh,jhjdrq,jhjdsj,sqsm,lrr,lrsj,dwmc ";
	ls_sql+=" from  crm_yjdjl,sq_dwxx";
	ls_sql+=" where crm_yjdjl.jdjlh='"+jdjlh+"' and crm_yjdjl.lrbm=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		sqr=cf.fillNull(rs.getString("sqr"));
		sqrlxdh=cf.fillNull(rs.getString("sqrlxdh"));
		jhjdrq=cf.fillNull(rs.getDate("jhjdrq"));
		jhjdsj=cf.fillNull(rs.getString("jhjdsj"));
		sqsm=cf.fillNull(rs.getString("sqsm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select cqbm,khjl,crm_zxkhxx.ssfgs,khxm,fwdz,hth,sjs,crm_zxkhxx.zxdm,dwmc,sgd,sgbz,zjxm,xcjdbz,sjhtje,tchtje";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cqbm=cf.fillNull(rs.getString("cqbm"));
		khjl=cf.fillNull(rs.getString("khjl"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		xcjdbz=cf.fillNull(rs.getString("xcjdbz"));
		sjhtje=rs.getInt("sjhtje");
		tchtje=rs.getInt("tchtje");
	}
	rs.close();
	ps.close();
	if(sjhtje==0 && tchtje!=0)
	{
	   khqdzt="��ǩ�ײ�������";
	}
	else if(tchtje==0 &&sjhtje!=0)
	{
	   khqdzt="��ǩ��ƺ�ͬ";
	}
    else if(tchtje==0 &&sjhtje==0) 
	 {
	   khqdzt="δǩ";
	}

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='���澭��' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
	}
	rs.close();
	ps.close();


	int cqCount=0;
	ls_sql="select count(*)";
	ls_sql+=" from  sq_kjdcq,sq_sgd";
	ls_sql+=" where  sq_sgd.ssfgs='"+ssfgs+"' and sq_kjdcq.sgd=sq_sgd.sgd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cqCount=rs.getInt(1);
	}
	rs.close();
	ps.close();

	int dmCount=0;
	ls_sql="select count(*)";
	ls_sql+=" from  sq_kjddm,sq_sgd";
	ls_sql+=" where  sq_sgd.ssfgs='"+ssfgs+"' and sq_kjddm.sgd=sq_sgd.sgd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmCount=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (cqCount>0 && dmCount>0)//����ʩ���ӿɽӵ�����������ʩ���ӿɽӵ�����
	{
		sgdStr =" select sq_sgd.sgd,sq_sgd.sgdmc||'��'||sq_sgd.dh||'��'||'��'||sq_sgd.kjdsm||'��'||DECODE(sq_sgd.sgdlx,'S0','','S1','��ֱ���ӣ�')||''  ";
		sgdStr+=" from sq_sgd,sq_kjdcq,sq_kjddm ";
		sgdStr+=" where sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.sgd=sq_kjdcq.sgd and sq_sgd.sgd=sq_kjddm.sgd";
		sgdStr+=" and sq_kjdcq.cqbm='"+cqbm+"' ";
		sgdStr+=" and sq_kjddm.dwbh='"+dwbh+"' ";
		sgdStr+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' OR (sq_sgd.tdbz='Y' and (sq_sgd.tdkssj>SYSDATE OR SYSDATE>sq_sgd.tdzzsj)) ) ";
		sgdStr+=" order by sq_sgd.sgdlx desc,sq_sgd.sgdmc";
	}
	else if (cqCount>0 )//����ʩ���ӿɽӵ�����
	{
		sgdStr =" select sq_sgd.sgd,sq_sgd.sgdmc||'��'||sq_sgd.dh||'��'||'��'||sq_sgd.kjdsm||'��'||DECODE(sq_sgd.sgdlx,'S0','','S1','��ֱ���ӣ�')||''  ";
		sgdStr+=" from sq_sgd,sq_kjdcq ";
		sgdStr+=" where sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.sgd=sq_kjdcq.sgd ";
		sgdStr+=" and sq_kjdcq.cqbm='"+cqbm+"' ";
		sgdStr+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' OR (sq_sgd.tdbz='Y' and (sq_sgd.tdkssj>SYSDATE OR SYSDATE>sq_sgd.tdzzsj)) ) ";
		sgdStr+=" order by sq_sgd.sgdlx desc,sq_sgd.sgdmc";
	}
	else if (dmCount>0 )//����ʩ���ӿɽӵ�����
	{
		sgdStr =" select sq_sgd.sgd,sq_sgd.sgdmc||'��'||sq_sgd.dh||'��'||'��'||sq_sgd.kjdsm||'��'||DECODE(sq_sgd.sgdlx,'S0','','S1','��ֱ���ӣ�')||''  ";
		sgdStr+=" from sq_sgd,sq_kjddm ";
		sgdStr+=" where sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.sgd=sq_kjddm.sgd";
		sgdStr+=" and sq_kjddm.dwbh='"+dwbh+"' ";
		sgdStr+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' OR (sq_sgd.tdbz='Y' and (sq_sgd.tdkssj>SYSDATE OR SYSDATE>sq_sgd.tdzzsj)) ) ";
		sgdStr+=" order by sq_sgd.sgdlx desc,sq_sgd.sgdmc";
	}
	else{
		sgdStr =" select sq_sgd.sgd,sq_sgd.sgdmc||'��'||sq_sgd.dh||'��'||'��'||sq_sgd.kjdsm||'��'||DECODE(sq_sgd.sgdlx,'S0','','S1','��ֱ���ӣ�')||''  ";
		sgdStr+=" from sq_sgd ";
		sgdStr+=" where sq_sgd.ssfgs='"+ssfgs+"' ";
		sgdStr+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' OR (sq_sgd.tdbz='Y' and (sq_sgd.tdkssj>SYSDATE OR SYSDATE>sq_sgd.tdzzsj)) ) ";
		sgdStr+=" order by sq_sgd.sgdlx desc,sq_sgd.sgdmc";
	}
%>

<html>
<head>
<title>Ԥ�����ɵ���ά��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {color: #0000FF}
.STYLE3 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE4 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform"  >
<div align="center">Ԥ�����ɵ���ά����Ԥ���׼�¼�ţ�<%=jdjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">�ʼ�����</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khjl%></td>
    <td align="right"><span class="STYLE2">�곤���绰</span></td>
    <td><%=dmjl%>��<%=dmjldh%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">ǩ��״̬</span></td>
    <td><%=khqdzt%></td>
	<td align="right"><span class="STYLE2">��ϵ�绰</span></td>
    <td><input type="button" value="�鿴�绰" onClick="window.open('/dhzx/dhzx/ViewZxDh.jsp?khbh=<%=khbh%>')"></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"><%=sqrq%></td>
  <td align="right" width="18%">������</td> 
  <td width="32%"><%=sqr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������ϵ�绰</td> 
  <td colspan="3"><%=sqrlxdh%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ƻ�Ԥ��������</td> 
  <td width="32%"><%=jhjdrq%></td>
  <td align="right" width="18%">�ƻ�Ԥ����ʱ��</td> 
  <td width="32%"><%=jhjdsj%> 
    ʱ</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����˵��</td> 
  <td colspan="3"><%=sqsm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><%=lrr%></td>
  <td align="right">¼��ʱ��</td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">¼�벿��</td>
  <td>
    <%=dwmc%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class=" STYLE4">*</span>ʩ����</td>
  <td colspan="3"><select name="sgd" style="FONT-SIZE:12PX;WIDTH:500PX" onChange="changeSgd(editform)" >
    <option value=""></option>
    <%
	cf.selectItem(out,sgdStr,sgd);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʩ���೤</td>
  <td><select name="sgbz" style="FONT-SIZE:12PX;WIDTH:250PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bzmc,bzmc||'��'||dh||'��' from sq_bzxx where sgd='"+sgd+"' and tdbz='N' order by bzmc",sgbz);
%>
  </select></td>
  <td align="right"><span class=" STYLE4">*</span>�ʼ�</td>
  <td><select name="zjxm" style="FONT-SIZE:12PX;WIDTH:250PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc",zjxm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class=" STYLE4">*</span>����ȷ��Ԥ��������</td>
  <td><input type="text" name="zzqrjdrq" size="20" maxlength="10"  value="<%=jhjdrq%>" onDblClick="JSCalendar(this)">  </td>
  <td align="right"><span class=" STYLE4">*</span>����ȷ��Ԥ����ʱ��</td>
  <td><input type="text" name="zzqrjdsj" size="6" maxlength="8"  value="<%=jhjdsj%>" >
    ��ʽ HH��MM(Сʱ������)</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class=" STYLE4">*</span><span class="STYLE2">�ɵ���</span></td>
  <td><input type="text" name="fbr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class=" STYLE4">*</span><span class="STYLE2">�ɵ�ʱ��</span></td>
  <td><input type="text" name="fbsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
    <input type="hidden" name="jdjlh" value="<%=jdjlh%>" readonly>
    <input type="hidden" name="khbh" value="<%=khbh%>" readonly> 
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
<%

}
catch (Exception e) {
	out.print("<BR>����:" + e);
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
  </table>

</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//����Ajax
	cf.ajax(out);
%>


function changeSgd(FormName)
{
	FormName.sgbz.length=1;


	if (FormName.sgd.value=="")
	{
		return;
	}


	var sql="select bzmc,bzmc||'��'||sq_bzxx.dh||'��' from sq_bzxx where sgd='"+FormName.sgd.value+"'  and tdbz='N' order by bzmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(editform.sgbz,ajaxRetStr);
}
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("������[Ԥ���׼�¼��]��");
		FormName.jdjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.zzqrjdrq)=="") {
		alert("������[����ȷ��Ԥ��������]��");
		FormName.zzqrjdrq.focus();
		return false;
	}
	//if(!(isDatetime(FormName.zzqrjdrq, "����ȷ��Ԥ��������"))) {
//		return false;
//	}
	if(	javaTrim(FormName.zzqrjdsj)=="") {
		alert("������[����ȷ��Ԥ����ʱ��]��");
		FormName.zzqrjdsj.focus();
		return false;
	}
	//if(!(isNumber(FormName.zzqrjdsj, "����ȷ��Ԥ����ʱ��"))) {
//		return false;
//	}

	if(	javaTrim(FormName.sgd)=="") {
		alert("������[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxm)=="") {
		alert("������[�ʼ�]��");
		FormName.zjxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fbr)=="") {
		alert("������[�ɵ���]��");
		FormName.fbr.focus();
		return false;
	}
	if(	javaTrim(FormName.fbsj)=="") {
		alert("������[�ɵ�ʱ��]��");
		FormName.fbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "�ɵ�ʱ��"))) {
		return false;
	}
	FormName.action="SaveXgFbCrm_yjdjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
