<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%
String khbh=request.getParameter("khbh");
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
//����¼��
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String ssfgs=null;
String sgdmc=null;
String zjxm=null;
String mgbz=null;
String nwgbz=null;
String sdgbz=null;
String yqgbz=null;
String sgd = null;
String hth = null;

String kgrq=null;
String jgrq=null;
int gqts=0;

String fgsmc=null;

String sgddh="";
String zjxmdh="";
String sjsdh="";

String yscsjlh=null;

double wdzgce=0;
double qye=0;

int count=0;
String gcysbbh="";//���հ汾��

try {
	conn=cf.getConnection();

	String getyscsjlh="";
	ls_sql="select yscsjlh";
	ls_sql+=" from crm_heysjl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ls_sql+=" and  clbz='9'";//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���Ѵ���4���ѽ����5������ͨ����6������δͨ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getyscsjlh=cf.fillNull(rs.getString("yscsjlh"));
	}
	rs.close();
	ps.close();

	if (!getyscsjlh.equals(""))
	{
		response.sendRedirect("EditCrm_heysjl.jsp?yscsjlh="+getyscsjlh);
	}

	ls_sql="select hth,khxm,fwdz,lxfs,sjs,fgsbh,sgdmc,zjxm,mgbz,nwgbz,sdgbz,yqgbz,kgrq,jgrq,gqts,crm_khxx.sgd ,gcysbbh";
	ls_sql+=" from  crm_khxx,sq_sgd ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)  and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		
		sjs=cf.fillNull(rs.getString("sjs"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));

		mgbz=cf.fillNull(rs.getString("mgbz"));
		nwgbz=cf.fillNull(rs.getString("nwgbz"));
		sdgbz=cf.fillNull(rs.getString("sdgbz"));
		yqgbz=cf.fillNull(rs.getString("yqgbz"));
		jgrq=cf.fillNull(rs.getString("jgrq"));
		
		kgrq=cf.fillNull(rs.getDate("kgrq"));

		gqts=rs.getInt("gqts");
		gcysbbh=cf.fillNull(rs.getString("gcysbbh"));
	}
	rs.close();
	ps.close();
	
	
	ls_sql="select dwmc ";
	ls_sql+=" from  sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsmc=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql="select dh ";
	ls_sql+=" from  sq_sgd ";
	ls_sql+=" where sgdmc='"+sgdmc+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgddh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();



	ls_sql="select dh ";
	ls_sql+=" from  sq_yhxx ";
	ls_sql+=" where yhmc ='"+sjs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql="select dh ";
	ls_sql+=" from  sq_yhxx ";
	ls_sql+=" where yhmc ='"+zjxm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxmdh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql=" select count(*) ";
	ls_sql+=" from crm_heysjl ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" and clbz='4'";//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("���������δ���գ�����¼��������");
		return;
	}


	ls_sql=" select substr(max(yscsjlh),8,3) ";
	ls_sql+=" from crm_heysjl ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	yscsjlh=khbh.trim()+cf.addZero(count+1,3);
	
%>

<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
.STYLE2 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform"  >
<div align="center">ѡ��������Ŀ(���մ�����¼��:<%=yscsjlh%>)</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF"> 
<td  width="15%" align="right">��ͬ�ţ�</td>
<td  width="35%" ><%=hth%></td>
<td  width="15%" align="right" >��Ŀ��ַ��</td>
<td width="35%" ><%=fwdz%></td>
</tr>
<tr bgcolor="#FFFFFF"> 
<td  align="right">�ͻ���</td>
<td  ><%=khxm%></td>
<td  align="right">�绰��</td>
<td  ><input name="button" type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="�鿴�绰" ></td>
</tr>
<tr bgcolor="#FFFFFF">
<td  align="right">���ʦ��</td>
<td  ><%=sjs%></td>
<td  align="right">�绰��</td>
<td  ><%=sjsdh%></td>
</tr>
<!-- <tr bgcolor="#FFFFFF"> 
<td colspan="4"  align="left">���ſͷ����ĵ绰��4008282365
  </td>
</tr> -->
<tr bgcolor="#FFFFFF"> 
<td  align="right">��Ŀ�ܼࣺ</td>
<td  ><%=sgdmc%></td>
<td  align="right">�绰��</td>
<td  ><%=sgddh%></td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="right" >Ʒ�ʹ���Ա��</td>
<td  ><%=zjxm%></td>
<td  align="right">�绰��</td>
<td  ><%=zjxmdh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" rowspan="5" align="right"><font color="#CC0000">*</font>������Ŀ</td>
  <td width="35%" rowspan="5" valign="top"><select name="gcysxmbm" size="10" multiple style="FONT-SIZE:12PX;WIDTH:200PX">
    <%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_heysxm where gcysbbh='"+gcysbbh+"' and gcysxmbm not in(select gcysxmbm from crm_heysjl where khbh='"+khbh+"'  ) and ysxmflbm='05' order by yssx","");
%>
  </select>
    <span class="STYLE2">��ѡ���������</span></td>
  <td align="right" valign="top"><font color="#CC0000">*</font><span class="STYLE1">�ͻ����</span></td>
  <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>������</td>
  <td><input type="text" name="ysr" value="<%=yhmc%>" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>����ʱ��</td>
  <td><input type="text" name="yssj" value="<%=cf.getDate()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><font color="#CC0000">*</font>¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="50" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1"><font color="#CC0000">*</font>¼��ʱ��</span></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.getDate()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="4" ></textarea></td>
  </tr>

    <tr align="center"> 
      <td colspan="4"> 
	<input name="bc" type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
	<input type="hidden" name="yscsjlh" value="<%=yscsjlh%>">
	<input type="hidden" name="sjs" value="<%=sjs%>">	
	<input type="hidden" name="sgd" value="<%=sgd%>">
	<input type="hidden" name="zjxm" value="<%=zjxm%>">
	<input type="hidden" name="lrbm" value="<%=lrbm%>">
	<input type="hidden" name="gcysbbh" value="<%=gcysbbh%>">
		</td>
    </tr>
</table>
</form>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���ռ�¼��</td>
	<td  width="6%">���ս��</td>
	<td  width="6%">���Ĵ���״̬</td>
	<td  width="16%">������Ŀ</td>
	
	<td  width="4%">������</td>
	<td  width="6%">����ʱ��</td>

	<td  width="26%">��ע</td>

</tr>
<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();

		ls_sql="SELECT crm_heysjl.ysjlh,DECODE(crm_heysjl.sjysjg,'0','�ϸ�','1','������') sjysjg,DECODE(crm_heysjl.clbz,'9','δ���','0','û����','1','����δ����','2','����','3','�Ѵ���','4','�ѽ��','5','����ͨ��','6','����δͨ��') clbz,dm_heysxm.gcysxmmc,crm_heysjl.ysr,crm_heysjl.yssj,crm_heysjl.bz ";
		ls_sql+=" FROM crm_heysjl,dm_heysxm";
	    ls_sql+=" where crm_heysjl.gcysxmbm=dm_heysxm.gcysxmbm(+) and crm_heysjl.khbh='"+khbh+"' ";
		ls_sql+=" order by crm_heysjl.ysjlh ";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		String[] keyName={"ysjlh"};
		pageObj.setKey(keyName);

		//�����г�������
		Hashtable coluParmHash=new Hashtable();
		ColuParm coluParm=null;

		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey={"ysjlh"};//�����в�����coluParm.key������
		coluParm.key=coluKey;//�����в�����coluParm.key������
		coluParm.link="ViewCrm_heysjl.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("ysjlh",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��
		


		pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDate();
		//������ʾ��
		String[] disColName={"ysr"};
		pageObj.setDisColName(disColName);



	%>
</table>
</body>
<%
}
catch (Exception e) {
	out.println("����ʧ��,��������: " + e);
	out.println(ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.yscsjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.yscsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	!selectChecked(FormName.gcysxmbm)) {
		alert("��ѡ��[������Ŀ]��");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yssj)=="") {
		alert("������[����ʱ��]��");
		FormName.yssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ysr)=="") {
		alert("������[������]��");
		FormName.ysr.focus();
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


	FormName.action="SaveChooseYsxm.jsp";

	FormName.submit();
	return true;
}


//-->
</SCRIPT>
