<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE3 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String fgsbh=null;
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

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;

double zqje=0;

double htjcbj=0;
double zjxjcbj=0;
double ljqyf=0;
double djazf=0;
double jsjs=0;


double jsbl=60;
double sdljsbl=80;

double sdlje=0;
double jsje=0;


double clf=0;
double gdyp=0;
double sjbk=0;



double clyf=0;
double yfgck=0;
double kzbjbl=5;

double kzbj=0;
double clfk=0;
double jfje=0;
double yfje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,wdzgce";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		htjcbj=rs.getDouble("wdzgce");

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));


		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (!gdjsjd.equals("X"))//1:�������ڽ�������
	{
		out.println("<BR>���������󣬽�����Ȳ���ȷ");
		return;
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

	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11' and fkcs=2";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//������Ʒ���ü�¼
	ls_sql="select sum(je)";
	ls_sql+=" from  cw_gdyplyjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and jsbz='0'";//0��δ���㣻1���ѽ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdyp=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	//���ϵ�
	ls_sql="select sum(pszje)";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where khbh='"+khbh+"' and psdzt in('2','3','5')";//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clf=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	//�Ѹ����̿�
	ls_sql="select sum(sjbk)";
	ls_sql+=" from  cw_sgdzqjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfgck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ljqyf=100;
	djazf=200;
	jsjs=htjcbj+zjxjcbj+ljqyf+djazf;
	jsjs=cf.round(jsjs,2);

	sdlje=8200;
	jsje=jsjs*jsbl/100+sdlje*sdljsbl/100;
	jsje=cf.round(jsje,2);

	kzbj=jsjs*kzbjbl/100;
	kzbj=cf.round(kzbj,2);


	yfje=jsje-clf-clyf-gdyp-yfgck-kzbj-clfk-jfje;
	yfje=cf.round(yfje,2);

	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_sgdwgjs";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_sgdwgjs.jsp" name="insertform" >
<div align="center">��¼������</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�����¼��</td>
	<td  width="8%">����</td>
	<td  width="7%">��������</td>
	<td  width="7%">��ͬ���</td>
	<td  width="6%">��������</td>
	<td  width="8%">�������</td>
	<td  width="7%">��������ܶ�</td>
	<td  width="4%">�������</td>
	<td  width="7%">������</td>
	<td  width="5%">���Ϸ�</td>
	<td  width="5%">������Ʒ</td>
	<td  width="7%">ʵ�ʲ���</td>
	<td  width="5%">¼����</td>
	<td  width="54%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_sgdzqjs.jsjlh,gdjsjdmc,cw_sgdzqjs.jsrq,cw_sgdzqjs.htje,cw_sgdzqjs.zjxje, DECODE(cw_sgdzqjs.jsjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','����ʩ���ɱ���','A','����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�'),cw_sgdzqjs.jsjsze,cw_sgdzqjs.jsbl||'%',cw_sgdzqjs.jsje,cw_sgdzqjs.clf,cw_sgdzqjs.gdyp,cw_sgdzqjs.sjbk,cw_sgdzqjs.lrr,cw_sgdzqjs.bz  ";
	ls_sql+=" FROM cw_sgdzqjs,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdzqjs.lx=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdzqjs.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdzqjs.lrsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_sgdzqjsCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
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
    <td align="right"><font color="#0000FF">�ʼ�����</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ܼ�</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">����</span></td>
    <td><%=dd%></td>
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
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">���齻������</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF"><input name="button3" type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxViewList.jsp?khbh=<%=khbh%>')" value="���ӱ���">
      <input name="button4" type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="���ռ�¼">
      <input name="button5" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="������Ϣ">
      <input name="button6" type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="���ϵ�"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">�����¼��</font></span></td>
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">�ͻ����</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">ʩ����</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">�ֳ�������</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��ͬ���̻�������</td> 
  <td width="32%"> 
    <input type="text" name="htjcbj" value="<%=htjcbj%>" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>������̻�������</td> 
  <td width="32%"> 
    <input type="text" name="zjxjcbj" value="<%=zjxjcbj%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�������˷�</td> 
  <td width="32%"> 
    <input type="text" name="ljqyf" value="<%=ljqyf%>" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�ƾ߰�װ��</td> 
  <td width="32%"> 
    <input type="text" name="djazf" value="<%=djazf%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�������</td> 
  <td colspan="3"> 
    <input type="text" name="jsjs" value="<%=jsjs%>" size="20" maxlength="17" >
    <span class="STYLE3">�����������ͬ���̻������ۣ�������̻������ۣ��������˷ѣ� �ƾ߰�װ��</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�������</td> 
  <td width="32%"><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" >
% </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�����������</td> 
  <td width="32%"><input type="text" name="tzjsbl" value="0" size="10" maxlength="9" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ˮ��·���</td>
  <td><input type="text" name="sdlje" value="<%=sdlje%>" size="20" maxlength="17" ></td>
  <td align="right"><span class="STYLE1">*</span>ˮ��·�������</td>
  <td><input type="text" name="sdljsbl" value="<%=sdljsbl%>" size="10" maxlength="9" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�����ܶ�</td> 
  <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" >
    <span class="STYLE3">�����ܶ�����������������������������������ˮ��·����ˮ��·�������</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>���Ϸ�</td> 
  <td width="32%"> 
    <input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�����˷�</td> 
  <td width="32%"> 
    <input type="text" name="clyf" value="<%=clyf%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������Ʒ</td> 
  <td width="32%"> 
    <input type="text" name="gdyp" value="<%=gdyp%>" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ѹ����̿�</td> 
  <td width="32%"> 
    <input type="text" name="yfgck" value="<%=yfgck%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>Ӧ���ʱ������</td> 
  <td width="32%"> 
    <input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="17" >
    ��  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>���ʱ���</td> 
  <td width="32%"> 
    <input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>���Ϸ���</td> 
  <td width="32%"> 
    <input type="text" name="clfk" value="<%=clfk%>" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�������</td> 
  <td width="32%"> 
    <input type="text" name="jfje" value="<%=jfje%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>Ӧ�����</td> 
  <td colspan="3"> 
    <input type="text" name="yfje" value="<%=yfje%>" size="20" maxlength="17" >
    <span class="STYLE3">Ӧ���������ܶ���Ϸѣ������˷ѣ�������Ʒ���Ѹ����̿���ʱ��𣭲��Ϸ���������</span></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">��������</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset"></td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[�����¼��]��");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(!(isFloat(FormName.htjcbj, "��ͬ���̻�������"))) {
		return false;
	}
	if(!(isFloat(FormName.zjxjcbj, "������̻�������"))) {
		return false;
	}
	if(!(isFloat(FormName.ljqyf, "�������˷�"))) {
		return false;
	}
	if(!(isFloat(FormName.djazf, "�ƾ߰�װ��"))) {
		return false;
	}
	if(!(isFloat(FormName.jsjs, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.jsbl, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.tzjsbl, "�����������"))) {
		return false;
	}
	if(!(isFloat(FormName.sdlje, "ˮ��·���"))) {
		return false;
	}
	if(!(isFloat(FormName.sdljsbl, "ˮ��·�������"))) {
		return false;
	}
	if(!(isFloat(FormName.jsje, "�����ܶ�"))) {
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
		return false;
	}
	if(!(isFloat(FormName.clyf, "�����˷�"))) {
		return false;
	}
	if(!(isFloat(FormName.gdyp, "������Ʒ"))) {
		return false;
	}
	if(!(isFloat(FormName.yfgck, "�Ѹ����̿�"))) {
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "Ӧ���ʱ������"))) {
		return false;
	}
	if(!(isFloat(FormName.kzbj, "���ʱ���"))) {
		return false;
	}
	if(!(isFloat(FormName.clfk, "���Ϸ���"))) {
		return false;
	}
	if(!(isFloat(FormName.jfje, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.yfje, "Ӧ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("������[��������]��");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "��������"))) {
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
