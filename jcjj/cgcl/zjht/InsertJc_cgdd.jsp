<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String khlx=request.getParameter("zt");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;
String xmzy="";
String zxdjbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh="";
String ssfgs=null;

String fkje=null;
String sqdj="";

String ddbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;
try {
	conn=cf.getConnection();

	if (khlx.equals("2"))//2:��װ�ͻ�;4:�Ǽ�װ�ͻ�
	{
		ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,crm_khxx.fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq,xmzy";
		ls_sql+=" from  sq_dwxx,crm_khxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			hth=cf.fillNull(rs.getString("hth"));
			sjs=cf.fillNull(rs.getString("sjs"));
			qye=cf.fillNull(rs.getString("qye"));
			kgrq=cf.fillNull(rs.getDate("kgrq"));
			jgrq=cf.fillNull(rs.getDate("jgrq"));
			ssfgs=cf.fillNull(rs.getString("fgsbh"));
			dmbh=cf.fillNull(rs.getString("dwbh"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

			zjxm=cf.fillNull(rs.getString("zjxm"));
			sgd=cf.fillNull(rs.getString("sgd"));
			sgbz=cf.fillNull(rs.getString("sgbz"));
			qyrq=cf.fillNull(rs.getDate("qyrq"));
			xmzy=cf.fillNull(rs.getString("xmzy"));
		}
		rs.close();
		ps.close();
	}
	else
	{
		ls_sql="select khxm,fwdz,lxfs,sjs,crm_zxkhxx.ssfgs,crm_zxkhxx.zxdm,dwmc,cxhdbm,zxdjbm";
		ls_sql+=" from  sq_dwxx,crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and  (crm_zxkhxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			sjs=cf.fillNull(rs.getString("sjs"));
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			dmbh=cf.fillNull(rs.getString("zxdm"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
			zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		}
		rs.close();
		ps.close();

		if (dmbh.equals(""))
		{
			ls_sql="select dwbh,dwmc";
			ls_sql+=" from  sq_dwxx";
			ls_sql+=" where dwbh='"+zxdjbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				dmbh=cf.fillNull(rs.getString("dwbh"));
				dwmc=cf.fillNull(rs.getString("dwmc"));
			}
			rs.close();
			ps.close();

		}
	}

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
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dmbh+"' and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//�����
	double lsd=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='51'";//11����װ�21:ľ�ţ�22:����23:���ģ�24���Ҿߣ�31:ľ�Ŷ���32:���񶩽�33:���Ķ���34���Ҿ߶��� 41�����ɶ���51�����������61��Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lsd=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (lsd>0)
	{
		fkje=lsd+"�������";
	}
	else{
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='32'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			lsd=rs.getDouble(1);
		}
		rs.close();
		ps.close();
		if (lsd>0)
		{
			fkje=lsd+"�����񶩽�";
		}
	}
	if (lsd==0)
	{
		fkje="δ������";
	}

	ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ddbh=khbh+cf.addZero(count+1,2);
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

<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">�������</td>
		<td  width="11%">����״̬</td>
		<td  width="10%">���񹤳�</td>
		<td  width="9%">��ͬ�ܶ�</td>
		<td  width="8%">�����ͬ���</td>
		<td  width="7%">̨���ͬ���</td>
		<td  width="7%">����ͬ���</td>
		<td  width="7%">������ͬ���</td>
		<td  width="6%">��ĿרԱ</td>
		<td  width="6%">פ��Ҿӹ���</td>
		<td  width="6%">չ���Ҿӹ���</td>
		<td  width="6%">¼����</td>
		<td  width="9%">¼��ʱ��</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_cgdd.ddbh as ddbh,clztmc,pdgcmc,jc_cgdd.htze,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.clgw as jc_cgdd_clgw,jc_cgdd.xmzy as jc_cgdd_xmzy,jc_cgdd.ztjjgw as ztjjgw,jc_cgdd.lrr,jc_cgdd.lrsj";
		ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx ";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
		ls_sql+=" and jc_cgdd.khbh='"+khbh+"'";
		ls_sql+=" order by jc_cgdd.lrsj desc";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDate();
	%>
	</table>
	<%
}
%>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��¼����񶩵���������ţ�<%=ddbh%>��<font color="#FF0000"><%if (count>0) out.print("ע��:�ÿͻ����ж���");%></font></div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="449" > 
      <div align="center">

<form method="post" action="" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#CCCCFF"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="19%" bgcolor="#CCCCFF"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="31%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">�ͻ�����</td>
              <td width="31%"><%=khxm%></td>
              <td width="19%" align="right">�ʼ�</td>
              <td width="31%"><%=zjxm%>��<%=zjdh%>�� </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
              <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="19%" bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
              <td width="31%" bgcolor="#CCCCFF"><%=sjs%>��<%=sjsdh%>��</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>��<%=dzdh%>�� </td>
              <td width="19%"> 
                <div align="right">�೤</div>
              </td>
              <td width="31%"><%=sgbz%>��<%=bzdh%>�� </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">��װǩԼ����</div>
              </td>
              <td width="31%"> <%=qyrq%> </td>
              <td width="19%"> 
                <div align="right">��װǩԼ��</div>
              </td>
              <td width="31%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">��ͬ��������</td>
              <td width="31%"><%=kgrq%></td>
              <td width="19%" align="right">��ͬ��������</td>
              <td width="31%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">�μӴ����</td>
              <td width="31%"> <%=cxhdbm%> </td>
              <td width="19%" align="right">����</td>
              <td width="31%"><%=fkje%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ĿרԱ</td>
              <td width="31%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
				<%
				if (xmzy.equals(""))
				{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
				}
				else{
					out.println("<option value=\""+xmzy+"\">"+xmzy+"</option>");
				}
				%> 
                </select>
                <input type="hidden" name="khlx" value="<%=khlx%>">
                <input type="hidden" name="ddbh" value="<%=ddbh%>" size="20" maxlength="9" readonly>
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
              </td>
              <td width="19%" align="right">���񶩽�</td>
              <td width="31%"> 
                <input type="text" name="dj" value="<%=sqdj%>" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">פ��Ҿӹ���</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
                </select>
              </td>
              <td width="19%" align="right">չ���Ҿӹ���</td>
              <td width="31%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�ƻ�����ʱ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jhccsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">�ƻ�����ʱ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jhfcsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">����Ʒ��</td>
              <td width="31%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
//Ŀǰ����	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='2' order by gysmc","");
%> 
                </select>
              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>�Ƿ��������ʦ</td>
              <td width="31%">
                <input type="radio" name="sfpsjs" value="1" checked>
                ��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">¼����</td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="19%" align="right">¼��ʱ��</td>
              <td width="31%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">¼�벿��</div>
              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right"></div>
              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="74" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                  <input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
                  <input type="hidden" name="qddm" value="<%=dmbh%>" >
                  <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}


	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}

	if(!(isDatetime(FormName.jhccsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhfcsj, "�ƻ�����ʱ��"))) {
		return false;
	}

/*
	if(	javaTrim(FormName.clgw)=="") {
		alert("������[פ��Ҿӹ���]��");
		FormName.clgw.focus();
		return false;
	}
	if(	javaTrim(FormName.ztjjgw)=="") {
		alert("������[չ���Ҿӹ���]��");
		FormName.ztjjgw.focus();
		return false;
	}
	if(	javaTrim(FormName.xmzy)=="") {
		alert("����û��[��ĿרԱ]��");
		FormName.xmzy.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfpsjs)) {
		alert("��ѡ��[�Ƿ��������ʦ]��");
		FormName.sfpsjs[0].focus();
		return false;
	}
	if (FormName.sfpsjs[1].checked)
	{
		if(	javaTrim(FormName.pdgc)=="") {
			alert("������[����Ʒ��]��");
			FormName.pdgc.focus();
			return false;
		}
	}
*/
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.dwbh.focus();
		return false;
	}
	FormName.action="SaveInsertJc_cgdd.jsp";
	FormName.submit();
	FormName.dy.disabled=false;
	return true;
}

//-->
</SCRIPT>
