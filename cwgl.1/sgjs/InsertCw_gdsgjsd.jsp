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
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");


String khbh=request.getParameter("khbh");

int count=0;

String khxm=null;
String fwdz=null;
String lxfs=null;
String xb=null;
String sjs=null;
String hth=null;
String qyrq=null;
String jgrq=null;
String dwbh=null;
String sjsbh=null;
String fgsbh=null;
String sgd=null;
String zjxm=null;
double wdzgce=0;
double qye=0;
double sjf=0;
double glf=0;
double sfke=0;
double zjxssk=0;

double yfgckze=0;
double gckzc=0;
double zjxje=0;
double zhzjxje=0;
double kglf=0;
double kqtk=0;
double zkl=0;
double gckk=0;
double suijin=0;
double suijinbfb=0;
double zjxsuijin=0;
double guanlif=0;
double zjxguanlif=0;

String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
String sjfkzc=null;
String zjxwcbz=null;
String gcjdmc=null;
String gckkspbz=null;
String fkcsmc=null;
String ztmc=null;

String cxhdbm=null;
String sffj=null;
double fjje=0;
double gsfje=0;
String sfyrz=null;
String rzsc=null;
String sfyyh=null;
String yhyy=null;
double khjsje=0;
String qsjhtsj=null;
double sjhtje=0;



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";

String fkxh="";
try {
	conn=cf.getConnection();
	ls_sql="select DECODE(zt,'2','��װ�ͻ�','3','�˵��ͻ�','4','�Ǽ�װ�ͻ�','5','��ƿͻ�') ztmc,zjxssk,guanlif,zjxguanlif,suijin,suijinbfb,zjxsuijin,cxhdbm,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy,fkcsmc,kqtk,kglf,gckkspbz,gcjdmc,zjxwcbz,gckk,zkl,sjfkzc,fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,glf,sfke,zjxje,zhzjxje,sgbz,jgrq,khjsje";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,cw_fkcs";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and khbh='"+khbh+"' and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ztmc=cf.fillNull(rs.getString("ztmc"));
		zjxssk=rs.getDouble("zjxssk");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zjxsuijin=rs.getDouble("zjxsuijin");
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sffj=cf.fillNull(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

		fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		gckkspbz=cf.fillNull(rs.getString("gckkspbz"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		gckk=rs.getDouble("gckk");
		zkl=rs.getDouble("zkl");
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		xb=cf.fillNull(rs.getString("xb"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		wdzgce=rs.getDouble("wdzgce");
		khjsje=rs.getDouble("khjsje");
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		guanlif=rs.getDouble("guanlif");
		zjxguanlif=rs.getDouble("zjxguanlif");

		sfke=rs.getDouble("sfke");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
	}
	rs.close();
	ps.close();


	//���ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//�೤�绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//�ʼ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql="select qsjhtsj,sjhtje from crm_zxkhxx ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qsjhtsj=cf.fillNull(rs.getDate("qsjhtsj"));
		sjhtje=rs.getDouble("sjhtje");
	}
	rs.close();
	ps.close();

%>


<form method="post" action="SaveInsertCw_gdsgjsd.jsp" name="insertform" target="_blank">
<div align="center">��¼�����ݣ��ͻ���ţ�<%=khbh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E8E8FF">
      <td align="right">�ͻ����</td>
      <td><%=khbh%>��<%=ztmc%>��</td>
      <td align="right">��ͬ��</td>
      <td><%=hth%></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td><div align="right">���ݵ�ַ</div></td>
      <td><%=fwdz%></td>
      <td><div align="right">�ͻ�����</div></td>
      <td><%=khxm%>��<%=lxfs%>��</td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td><div align="right">ǩԼ����</div></td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
      <td bgcolor="#E8E8FF" align="right">���ʦ</td>
      <td><%=sjs%>��<%=sjsdh%>�� </td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right" bgcolor="#E8E8FF">ʩ����</td>
      <td colspan="2"><%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
      <td>�ʼ죺<%=zjxm%>��<%=zjdh%>�� </td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td><div align="right">ǩԼ������ͬ����</div></td>
      <td>[<%=qyrq%>]����[<%=jgrq%>]</td>
      <td><div align="right">���̽���</div></td>
      <td><%=gcjdmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">����Ԥ���</td>
      <td width="33%"><input type="text" name="wdzje" value="<%=wdzgce%>" size="20" maxlength="17" readonly></td>
      <td align="right" width="17%">ʵ�տ�</td>
      <td width="33%"><input type="text" name="ssk" value="<%=sfke%>" size="20" maxlength="17" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">ί�н�</td>
      <td width="33%"> 
      <input type="text" name="wtj" value="<%=sjhtje%>" size="20" maxlength="17" >      </td>
      <td align="right" width="17%">ί�н�����</td>
      <td width="33%"> 
      <input type="text" name="wtjrq" value="<%=qsjhtsj%>" size="20" maxlength="10"  onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�����</td>
      <td width="33%"> 
      <input type="text" name="jsk" value="<%=khjsje%>" size="20" maxlength="17" >      </td>
      <td align="right" width="17%">��������</td>
      <td width="33%"> 
      <input type="text" name="jsrq" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">ľ������</td>
      <td width="33%"> 
      <input type="text" name="mgfy" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="17%">ľ������</td>
      <td width="33%"> 
      <input type="text" name="mgrq" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">ˮ�繤����</td>
      <td width="33%"> 
      <input type="text" name="sdgfy" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="17%">ˮ�繤����</td>
      <td width="33%"> 
      <input type="text" name="sdgrq" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ˮ������</td>
      <td width="33%"> 
      <input type="text" name="nsgfy" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="17%">��ˮ������</td>
      <td width="33%"> 
      <input type="text" name="nsgrq" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">���Ṥ����</td>
      <td width="33%"> 
      <input type="text" name="yqgfy" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="17%">���Ṥ����</td>
      <td width="33%"> 
      <input type="text" name="yqgrq" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��Ʊ���</td>
      <td><input type="radio" name="kpqk" value="1">��Ʊ
      <input type="radio" name="kpqk" value="2">δ��Ʊ</td>
      <td align="right">��Ʊ���</td>
      <td><input type="text" name="kpje" value="" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�����Ͻ�ʱ��</td>
      <td><input type="text" name="dasjsj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
      <td align="right">Ч��ͼʱ��</td>
      <td><input type="text" name="xgtsj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��ɽ��</td>
      <td><input type="text" name="tcje" value="" size="20" maxlength="10"></td>
      <td align="right">�������</td>
      <td><input type="text" name="tcrq" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">ί�н��Ƿ�ת���̿�</td>
      <td><input type="radio" name="wtjzgck" value="1">
        ��
          <input type="radio" name="wtjzgck" value="2">
      ��</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">¼����</td>
      <td width="33%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
      <td align="right" width="17%">¼��ʱ��</td>
      <td width="33%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">¼�벿��</td>
      <td width="33%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
      </select></td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"></textarea>      </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#E8E8FF" >����֧����ϸ</td>
    </tr>
<%
	String fybm=null;
	String fymc=null;
	ls_sql="select fybm,fymc";
	ls_sql+=" from cw_gdfybm";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();


	int js=4;

	while (js==4)
	{
		js=0;
		%>
		<tr bgcolor="#FFFFFF"> 
		<%

		if (rs.next())
		{
			fybm=rs.getString("fybm");
			fymc=rs.getString("fymc");
			js++;

			%>
			  <td width="25%" ><%=fymc%>��
				<input type="text" name="fybm<%=fybm%>" value="0" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			  </td>
			<%
		}
		if (rs.next())
		{
			fybm=rs.getString("fybm");
			fymc=rs.getString("fymc");
			js++;

			%>
			  <td width="25%" ><%=fymc%>��
				<input type="text" name="fybm<%=fybm%>" value="0" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			  </td>
			<%
		}
		if (rs.next())
		{
			fybm=rs.getString("fybm");
			fymc=rs.getString("fymc");
			js++;

			%>
			  <td width="25%" ><%=fymc%>��
				<input type="text" name="fybm<%=fybm%>" value="0" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			  </td>
			<%
		}
		if (rs.next())
		{
			fybm=rs.getString("fybm");
			fymc=rs.getString("fymc");
			js++;

			%>
			  <td width="25%" ><%=fymc%>��
				<input type="text" name="fybm<%=fybm%>" value="0" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			  </td>
			<%
		}
		%>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
	
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" >
        <input type="button"  value="����" onClick="f_do(insertform)">
      <input type="reset"  value="����" name="reset">      </td>
    </tr>
  </table>
</form>
</body>
</html>


<%
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.wdzje)=="") {
		alert("������[����Ԥ���]��");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "����Ԥ���"))) {
		return false;
	}
	if(	javaTrim(FormName.ssk)=="") {
		alert("������[ʵ�տ�]��");
		FormName.ssk.focus();
		return false;
	}
	if(!(isFloat(FormName.ssk, "ʵ�տ�"))) {
		return false;
	}
	if(!(isFloat(FormName.wtj, "ί�н�"))) {
		return false;
	}
	if(!(isDatetime(FormName.wtjrq, "ί�н�����"))) {
		return false;
	}
	if(!(isFloat(FormName.jsk, "�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.mgfy, "ľ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.mgrq, "ľ������"))) {
		return false;
	}
	if(!(isFloat(FormName.sdgfy, "ˮ�繤����"))) {
		return false;
	}
	if(!(isDatetime(FormName.sdgrq, "ˮ�繤����"))) {
		return false;
	}
	if(!(isFloat(FormName.nsgfy, "��ˮ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.nsgrq, "��ˮ������"))) {
		return false;
	}
	if(!(isFloat(FormName.yqgfy, "���Ṥ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.yqgrq, "���Ṥ����"))) {
		return false;
	}

	if(!(isFloat(FormName.kpje, "��Ʊ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.dasjsj, "�����Ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xgtsj, "Ч��ͼʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.tcje, "��ɽ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tcrq, "�������"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
