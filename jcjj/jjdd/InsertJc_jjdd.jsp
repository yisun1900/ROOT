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
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zt=request.getParameter("zt");

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String khjl=null;
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

String sqdj="";

String ddbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String listSql="";
String gcjdbm="";
String jjwjbz="";
int count=0;

try {
	conn=cf.getConnection();

	if (zt.equals("2"))//2:��װ�ͻ�;4:�Ǽ�װ�ͻ�
	{
		ls_sql="select gcjdbm,fgsbh,khxm,fwdz,lxfs,hth,sjs,khjl,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq,crm_khxx.xmzy,crm_khxx.jjwjbz";
		ls_sql+=" from  sq_dwxx,crm_khxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
			ssfgs=cf.fillNull(rs.getString("fgsbh"));
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			hth=cf.fillNull(rs.getString("hth"));
			khjl=cf.fillNull(rs.getString("khjl"));
			sjs=cf.fillNull(rs.getString("sjs"));
			qye=cf.fillNull(rs.getString("qye"));
			kgrq=cf.fillNull(rs.getDate("kgrq"));
			jgrq=cf.fillNull(rs.getDate("jgrq"));
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			dmbh=cf.fillNull(rs.getString("dwbh"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

			zjxm=cf.fillNull(rs.getString("zjxm"));
			sgd=cf.fillNull(rs.getString("sgd"));
			sgbz=cf.fillNull(rs.getString("sgbz"));
			qyrq=cf.fillNull(rs.getDate("qyrq"));
			xmzy=cf.fillNull(rs.getString("xmzy"));
			jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		}
		rs.close();
		ps.close();
	}
	else{
		ls_sql="select khxm,fwdz,lxfs,sjs,khjl,crm_zxkhxx.ssfgs,crm_zxkhxx.zxdm,dwmc,cxhdbm,zxdjbm";
		ls_sql+=" from  sq_dwxx,crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and  (crm_zxkhxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			khjl=cf.fillNull(rs.getString("khjl"));
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

	if (gcjdbm.equals("5"))
	{
		out.println("���󣡿ͻ�����ᣬ������¼�붩��");
		return;
	}

	if (jjwjbz.equals("Y"))
	{
		out.println("���󣡿ͻ��Ҿ�����ᣬ������¼�붩��");
		return;
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
	ls_sql+=" where zwbm='05' and ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where zwbm='04' and dwbh='"+dmbh+"' and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
	ls_sql+=" from  jc_jjdd";
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
		<td  width="11%">�Ҿ߹���</td>
		<td  width="11%">�Ͳ��Ź���</td>
		<td  width="9%">��ͬ�ܶ�</td>
		<td  width="9%">�Ҿ߽��</td>
		<td  width="8%">�Ͳ��Ž��</td>
		<td  width="6%">��ĿרԱ</td>
		<td  width="6%">פ��Ҿӹ���</td>
		<td  width="6%">չ���Ҿӹ���</td>
		<td  width="6%">¼����</td>
		<td  width="9%">¼��ʱ��</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_jjdd.ddbh,clztmc,jc_jjdd.pdgcmc,jc_jjdd.xcmgcmc,jc_jjdd.htze,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.clgw as jc_jjdd_clgw,jc_jjdd.xmzy as jc_jjdd_xmzy,jc_jjdd.ztjjgw as ztjjgw,jc_jjdd.lrr,jc_jjdd.lrsj";
		ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+) and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
		ls_sql+=" and jc_jjdd.khbh='"+khbh+"'";
		ls_sql+=" order by jc_jjdd.lrsj desc";
//		out.println(ls_sql);
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
      <div align="center">��¼��Ҿ߶�����������ţ�<%=ddbh%>��<font color="#FF0000"><%if (count>0) out.print("ע��:�ÿͻ����ж���");%></font></div>
    </td>
  </tr>
  <tr>
    <td width="100%"> 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"> �ͻ���� </td>
              <td bgcolor="#CCCCFF"><%=khbh%> </td>
              <td align="right" bgcolor="#CCCCFF"> ��ͬ�� </td>
              <td bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">�ͻ�����</td>
              <td><%=khxm%></td>
              <td align="right">�ʼ�</td>
              <td><%=zjxm%>��<%=zjdh%>�� </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr>
              <td bgcolor="#CCCCFF" align="right">ǩԼ����</td>
              <td bgcolor="#CCCCFF"><%=dwmc%></td>
              <td bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
              <td bgcolor="#CCCCFF"><%=sjs%>��<%=sjsdh%>��</td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"> ʩ���� </td>
              <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
                ��<%=dzdh%>�� </td>
              <td align="right"> �೤ </td>
              <td><%=sgbz%>��<%=bzdh%>�� </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"> ��װǩԼ���� </td>
              <td><%=qyrq%> </td>
              <td align="right"> ��װǩԼ�� </td>
              <td><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">��ͬ��������</td>
              <td><%=kgrq%></td>
              <td align="right">��ͬ��������</td>
              <td><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right">�μӴ����</td>
              <td colspan="3"><%=cxhdbm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>��ĿרԱ</td>
              <td width="31%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
				<%
				if (xmzy.equals(""))
				{
					out.println("<option value=\"\"></option>");

					listSql=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N')";
					listSql+=" UNION ALL ";
					listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N')";
					listSql+=" ORDER BY c2 ";
					cf.selectItem(out,listSql,"");
				}
				else{
					out.println("<option value=\""+xmzy+"\">"+xmzy+"</option>");
				}
				%> 
                </select>              </td>
              <td width="21%" align="right">�Ҿ߶���</td>
              <td width="29%"> 
                <input type="text" name="dj" value="<%=sqdj%>" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>פ��Ҿӹ���</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" ORDER BY c2 ";
	cf.selectItem(out,listSql,yhmc);
%> 
                </select>              </td>
              <td width="21%" align="right"><font color="#FF0000">*</font>չ���Ҿӹ���</td>
              <td width="29%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" ORDER BY c2 ";
	cf.selectItem(out,listSql,yhmc);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ƻ�����ʱ��</td>
              <td width="31%"> 
                <input type="text" name="jhccsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="21%" align="right"><font color="#FF0000">*</font>�Ƿ��������ʦ</td>
              <td width="29%"> 
                <input type="radio" name="sfpsjs" value="1" checked>
                ��              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�Ҿ߹���</td>
              <td width="31%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	String sql="select sq_gysxx.gysbh,sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+ssfgs+"' and sq_gysxx.gyslb='3' order by sq_gysxx.gysmc";
	cf.selectItem(out,sql,"");
%> 
                </select>              </td>
              <td width="21%" align="right">�Ͳ��Ź���</td>
              <td width="29%"> 
                <select name="xcmgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	sql="select sq_gysxx.gysbh,sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+ssfgs+"' and sq_gysxx.gyslb='3' order by sq_gysxx.gysmc";
	cf.selectItem(out,sql,"");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">¼����</td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="21%" align="right">¼��ʱ��</td>
              <td width="29%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">¼�벿��</td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
              <td width="21%">&nbsp;</td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="73" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                  <input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
                  <input type="hidden" name="qddm" value="<%=dmbh%>" >
                  <input type="hidden" name="khjl" value="<%=khjl%>" >
                  <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                  <input type="hidden" name="ddbh" value="<%=ddbh%>" readonly>
                  <input type="hidden" name="khbh" value="<%=khbh%>" readonly>
                  <input type="hidden" name="zt" value="<%=zt%>">
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����" name="reset">
                  <input type="button" value="��ӡԤ����" onClick="window.open('/jcjj/dygl/dyydd.jsp?lx=jj&ddbh=<%=ddbh%>&khbh=<%=khbh%>')" name="dy" disabled>                </td>
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

	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}

	if(!(isDatetime(FormName.jhccsj, "�ƻ�����ʱ��"))) {
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.dwbh.focus();
		return false;
	}
	FormName.action="SaveInsertJc_jjdd.jsp";
	FormName.submit();
	FormName.dy.disabled=false;
	return true;
}

//-->
</SCRIPT>
