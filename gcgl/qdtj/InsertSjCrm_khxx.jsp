<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.Date,java.text.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");

String yhmc=(String)session.getAttribute("yhmc");
String zdyhbz=(String)session.getAttribute("zdyhbz");

String ssfgs=null;
String dqbm=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zxdm="";
String khxm="";
String xb="";
String cqbm="";
String fwdz="";
String lxfs="";
String sjs="";
String khjl="";

String csrq="";
String zybm="";
String fj="";
String xqbm="";
String khlxbm="";
String hxbm="";
String fwmj="";
String fgyqbm="";
String bjjb="";
String ywy="";
String hdbz="";
String cgdz="";
String hdr="";
String jzbz="";
String louhao="";
String jiedao="";
String ywyssxz=null;
String sjsbh=null;

String lrsj1=null;//��Ϣ¼��ʱ��


double qye1=0;
double qye=0;
//int qye=0;
double sjf=0;
double glf=0;
double zcbjje=0;

String mark="";
String hth="";
String qtdh=null;
String email=null;
String ysy=null;

String dzbjjc="";//1���˹�¼��[�ۿ��ʡ�����ԭ����]������[�ۿ��ʡ�����ԭ����]�Զ�����[ǩԼ��]��2���˹�¼��[ǩԼ�����ԭ����]������[ǩԼ�����ԭ����]�Զ�����[�ۿ���] ��3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ�����ԭ����]�����Զ�����4�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ�5�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]
String zxkhlrjc="";//ǩ���Ǽ��У�[��ѯ¼��ʱ��]��[ǩ��¼��ʱ��]���������С����
int zxkhlrts=0;//��ѯ�ͻ���ǰ¼������

double sjjryjbfb=0;
double sssjf=0;

try {
	conn=cf.getConnection();

	ls_sql="select ysy,ywyssxz,sjsbh,jiedao,hth,khjl,sjf,qtdh,email,louhao,zcbjje,zxdm,jzbz,ywy,khxm,xb,cqbm,fwdz,lxfs,sjs,csrq,zybm,fj,xqbm,khlxbm,hxbm,fwmj,fgyqbm,bjjb,hdbz,cgdz,hdr,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
    //out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysy=cf.fillNull(rs.getString("ysy"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		hth=cf.fillNull(rs.getString("hth"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sssjf=rs.getDouble("sjf");
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		louhao=cf.fillNull(rs.getString("louhao"));
		zcbjje=rs.getDouble("zcbjje");
		zxdm=cf.fillNull(rs.getString("zxdm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		ywy=cf.fillNull(rs.getString("ywy"));
		khxm=rs.getString("khxm");
		xb=cf.fillNull(rs.getString("xb"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=rs.getString("fwdz");
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		csrq=cf.fillNull(rs.getDate("csrq"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=rs.getString("fj");
		xqbm=cf.fillNull(rs.getString("xqbm"));
		khlxbm=rs.getString("khlxbm");
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=rs.getString("fwmj");
		fgyqbm=rs.getString("fgyqbm");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dqbm,dzbjjc,zxkhlrjc,zxkhlrts,sjjryjbfb";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));//���õ��ӱ��ۼ��
		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));//������ѯ�ͻ�¼����
		zxkhlrts=rs.getInt("zxkhlrts");//��ѯ�ͻ���ǰ¼������

		sjjryjbfb=rs.getDouble("sjjryjbfb");//��ƿͻ�����ҵ���տ���� 
	}
	rs.close();
	ps.close();

  
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#CCCCFF"  style="FONT-SIZE:14">

<form method="post" action="" name="insertform" target='_blank'>

      <div align="center">��ƿͻ�--¼�루<font color="#FF0033">*</font>Ϊ�����ֶΣ����ͻ���ţ�<%=khbh%>��</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>��ͬ��</td>
      <td><input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20"  >
      </td>
      <td align="right">�����ͬ���</td>
      <td><input type="text" name="smhtbh" value="" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">�ͻ�����</font>      </td>
      <td width="34%"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
        <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="50" readonly>      </td>
      <td width="17%" align="right"> 
      <font color="#FF0033">*</font>�Ա�      </td>
      <td width="33%"> 
        <input type="radio" name="xb"  value="M" <% if (xb.equals("M")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        �� 
        <input type="radio" name="xb"  value="W" <% if (xb.equals("W")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        Ů </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�ֻ�</td>
      <td colspan="3"> 
        <input type="text" name="lxfs" value="<%=lxfs%>" size="40" maxlength="50">
        <font color="#FF0000">���ڽ��ն��ţ����¼һ��,�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�</font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�����绰</td>
      <td colspan="3"> 
        <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50">
        <font color="#FF0000">(ע�⣺�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�)</font>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�����ʼ�</td>
      <td width="34%"> 
      <input type="text" name="email" value="<%=email%>" size="30" maxlength="50">      </td>
      <td width="17%" align="right">ҵ�����֤����</td>
      <td width="33%"> 
        <input type="text" name="sfzhm" value="" size="20" maxlength="18" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">���ݵ�ַ</font>      </td>
      <td colspan="3"> 
        <input type="hidden" name="cqbm" value="<%=cqbm%>" >
        <input type="hidden" name="xqbm" value="<%=xqbm%>" >
        <input type="hidden" name="louhao" value="<%=louhao%>">
        <input type="hidden" name="jiedao" value="<%=jiedao%>">
        <input type="text" name="fwdz" value="<%=fwdz%>" size="74" maxlength="100"  onKeyUp="keyTo(cqbm)" readonly>      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��ϵ�ͻ�</td>
      <td width="34%"> 
        <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(sjs)">
          <%
	if (zdyhbz.equals("Y"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
	}
	else{
		out.println("<option value=\"04\">��ͨ�ͻ�</option>");
	}
%> 
        </select>      </td>
      <td width="17%" align="right"><font color="#FF0033">*</font>��װ��־</td>
      <td width="33%"> 
        <select name="jzbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectToken(out,"1+��װ&2+��װ",jzbz,false);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">���ʦ</font>      </td>
      <td width="34%"> 
        <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly>      </td>
      <td width="17%" align="right"> 
        <font color="#0000FF">ҵ��Ա</font>      </td>
      <td width="33%"> 
        <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�ͻ�����</font></td>
      <td><input name="khjl" type="text" id="khjl" value="<%=khjl%>" size="20" maxlength="20" readonly></td>
      <td align="right" width="17%"><font color="#FF0033">*</font>ǩԼ����</td>
      <td width="33%"><input type="text" name="qyrq" value="<%=cf.today()%>" size="20" maxlength="10" onKeyUp="keyGo(kgrq)" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��Ʒ�</td>
      <td width="34%"> 
        <input type="text" name="sjf" value="" size="20" maxlength="16"  >      </td>
      <td align="right" width="17%"><font color="#0000CC">�ۿ�</font></td>
      <td width="33%"><input type="text" name="zkl" value="10" size="20" maxlength="20" readonly>
        <font color="red">(0---10) </font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC">����ԭ����</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="0" size="20" maxlength="8"  readonly>      </td>
      <td align="right" width="17%"><font color="#FF0033">*</font><font color="#0000CC">�ۺ�ǩԼ��</font></td>
      <td width="33%"><input type="text" name="qye" value="0" size="20" maxlength="8" readonly></td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�ͻ�����</td>
      <td width="34%"> 
        <input type="radio" name="zt" value="5" checked >
        ��ƿͻ� </td>
      <td width="17%" align="right">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC">ǩԼ����</font></td>
      <td width="34%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'","");
%> 
        </select>      </td>
      <td width="17%" align="right"><font color="#FF0033">*</font><font color="#0000CC">�����ֹ�˾</font></td>
      <td width="33%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font>      </td>
      <td width="34%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">      </td>
      <td width="17%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">��Ϣ¼����</font>      </td>
      <td width="33%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        ��ע      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3" onKeyUp="keyTo(savebutton)"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="sjsbh" value="<%=sjsbh%>"  >
        <input type="hidden" name="ywyssxz" value="<%=ywyssxz%>"  >
        <input type="hidden" name="ysy" value="<%=ysy%>"  >
        <input type="button"  value="����" onClick="f_do(insertform)" name="savebutton">
        <input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.hth)=="") {
		alert("������[��ͬ��]��");
		FormName.hth.focus();
		return false;
	}

	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="" && FormName.qtdh.value=="") {
		alert("������[�ֻ�]��[�����绰]��");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isMPhone(FormName.lxfs, "�ֻ�"))) {
		return false;
	}
	if(!(isPhone(FormName.qtdh, "�����绰"))) {
		return false;
	}
	if(!(isEmail(FormName.email, "�����ʼ�"))) {
		return false;
	}

	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}

<%
	if (ssfgs.equals("FBJ00"))
	{
		%>
		if(	javaTrim(FormName.sfzhm)=="") {
			alert("������[ҵ�����֤����]��");
			FormName.sfzhm.focus();
			return false;
		}
		if(!(isSfzhm(FormName.sfzhm, "���֤����"))) {
			return false;
		}
		<%
	}
%>

	if(	javaTrim(FormName.sjs)=="") {
		alert("������[���ʦ]��");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("��ѡ��[��ϵ�ͻ�]��");
		FormName.khlxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sjf)=="") {
		alert("������[��Ʒ�]��");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "��Ʒ�"))) {
		return false;
	}
	if (parseFloat(FormName.sjf.value)==0)
	{
		alert("[��Ʒ�]����Ϊ0��");
		FormName.sjf.select();
		return false;
	}
	
	//����ط��Ѿ��Ĺ���2005-12-30��
	if(!(isFloat(FormName.zkl, "�ۿ�ϵ��!!"))) {
		return false;
	}
	if (parseFloat(FormName.zkl.value)<0 ||parseFloat(FormName.zkl.value)>10)
	{

		alert("[�ۿ�ϵ��]����С��0���ߴ���10��");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[����ǩԼ��]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "����ǩԼ��"))) {
		return false;
	}
/*
	if (parseFloat(FormName.qye.value)==0)
	{
		alert("[����ǩԼ��]����Ϊ0��");
		FormName.qye.select();
		return false;
	}
*/
	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[δ���۹��̶�]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "δ���۹��̶�"))) {
		return false;
	}
/*	
	if (parseFloat(FormName.wdzgce.value)==0)
	{
		alert("[����ԭ����]����Ϊ0��");
		FormName.wdzgce.select();
		return false;
	}
*/
	if (parseFloat(FormName.wdzgce.value)<parseFloat(FormName.qye.value))
	{
		alert("[����ԭ����]����С��[����ǩԼ��]��");
		FormName.qye.select();
		return false;
	}


	if(	javaTrim(FormName.qyrq)=="") {
		alert("������[ǩԼ����]��");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if (FormName.qyrq.value > "<%=cf.today()%>")
	{
		alert("[ǩԼ����]���ܴ���[����]��");
		FormName.qyrq.select();
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



	
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[��Ϣ¼����]��");
		FormName.lrr.focus();
		return false;
	}

/*
	if(	javaTrim(FormName.sjsbh)=="") {
		alert("������[���������]��");
		FormName.sjsbh.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[ǩԼ����]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}

	if(!FormName.zt.checked) {
		alert("������[�ͻ�����]��");
		FormName.zt.focus();
		return false;
	}
 
	if ( <%=sssjf%> < FormName.sjf.value/100.0*<%=(sjjryjbfb-0.5)%> )
	{
		alert("����Ʒѡ�¼�����ʵ����Ʒѡ�<%=sssjf%>��δ�ﵽ��˾ʵ�ձ�׼��<%=sjjryjbfb%>��%�涨");
		FormName.sjf.select();
		return false;
	}
   
	FormName.action="SaveInsertSjCrm_khxx.jsp";
	FormName.submit();

	return true;
}


//-->
</SCRIPT>
