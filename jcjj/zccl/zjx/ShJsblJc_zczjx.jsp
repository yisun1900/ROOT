<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");
String yhmc=(String)session.getAttribute("yhmc");

String zczjxyybm=null;
String htshsj=null;
String lrr=null;
String lrsj=null;
String zjxfssj=null;
String dwbh=null;
String bz=null;
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;
String clgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String ddhtshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String ddbz=null;
double hkze=0;
double zjhze=0;
String ddlx=null;

double zqzjxze=0;
double zjxze=0;
double zjxcbze=0;
double zjxzkl=0;
String dzyy=null;
double zjxcxhdje=0;

double zqzjxclf=0;
double zhzjxclf=0;
double zjxycf=0;
double zjxqtf=0;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;
String ztjjgw=null;
String htcxhdje=null;

String ddbh=null;
String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
String sfjs=null;
String sxhtsfysh="";


try {
	conn=cf.getConnection();

	ls_sql="select sxhtsfysh,sfjs,ddbh,zczjxyybm,htshsj,lrr,lrsj,zjxfssj,dwbh,bz,ddlx,zjxzkl,dzyy ";
	ls_sql+=" ,zjxcbze,zqzjxze,zjxze,zjxzkl,dzyy,zjxcxhdje,zqzjxclf,zhzjxclf,zjxycf,zjxqtf";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where (zjxbh='"+zjxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		zjxcbze=rs.getDouble("zjxcbze");
		zqzjxze=rs.getDouble("zqzjxze");
		zjxze=rs.getDouble("zjxze");
		zjxzkl=rs.getDouble("zjxzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		zqzjxclf=rs.getDouble("zqzjxclf");
		zhzjxclf=rs.getDouble("zhzjxclf");
		zjxycf=rs.getDouble("zjxycf");
		zjxqtf=rs.getDouble("zjxqtf");


		ddbh=cf.fillNull(rs.getString("ddbh"));
		zczjxyybm=cf.fillNull(rs.getString("zczjxyybm"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		bz=cf.fillNull(rs.getString("bz"));
		ddlx=cf.fillNull(rs.getString("ddlx"));

	}
	rs.close();
	ps.close();

	if (!sxhtsfysh.equals("N"))
	{
		out.println("<BR>������д��ͬ�����");
		return;
	}




	if (!sfjs.equals("N") && !sfjs.equals("C"))//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M�����������
	{
		out.println("<BR>�����ѽ��㲻�����޸�");
		return;
	}

	ls_sql="select ztjjgw,htcxhdje,zcdlbm,zcxlbm,ppbm,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,zjhze ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		ddhtshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		ddbz=cf.fillNull(rs.getString("bz"));
		hkze=rs.getDouble("hkze");
		zjhze=rs.getDouble("zjhze");
	}
	rs.close();
	ps.close();


	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
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
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
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
<title>�����д��ͬ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<form method="post" action="" name="editform" target="_blank">
  <div align="center"> 
  <div align="center">�����д��Ŀ���������������ţ�<%=ddbh%>����ţ�<%=zjxbh%>��
          
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#CCCCFF"> 
        �ͻ����      </td>
      <td width="40%" bgcolor="#CCCCFF"> <%=khbh%> </td>
      <td width="18%" align="right" bgcolor="#CCCCFF"> 
        ��ͬ��      </td>
      <td width="26%" bgcolor="#CCCCFF"><%=hth%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="16%" align="right">�ͻ�����</td>
      <td width="40%"><%=khxm%></td>
      <td width="18%" align="right">�ʼ�</td>
      <td width="26%"><%=zjxm%></td>
    </tr>
    <tr> 
      <td width="16%" bgcolor="#CCCCFF" align="right">���ݵ�ַ</td>
      <td width="40%" bgcolor="#CCCCFF"><%=fwdz%></td>
      <td width="18%" bgcolor="#CCCCFF" align="right">��װǩԼ��</td>
      <td width="26%" bgcolor="#CCCCFF"><%=qye%></td>
    </tr>
    <tr> 
      <td width="16%" bgcolor="#CCCCFF" align="right">���桢���ʦ</td>
      <td width="40%" bgcolor="#CCCCFF"><%=dwmc%>��<%=sjs%></td>
      <td width="18%" bgcolor="#CCCCFF" align="right">��װǩԼ����</td>
      <td width="26%" bgcolor="#CCCCFF"><%=qyrq%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="16%" align="right">ʩ���ӡ��೤</td>
      <td width="40%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>        ��<%=sgbz%></td>
      <td width="18%" align="right">��ͬ������������</td>
      <td width="26%"><%=kgrq%>---<%=jgrq%></td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right">�μӴ����</td>
      <td colspan="3"> <%=cxhdbm%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right">�������ʡ��ص�</td>
      <td width="40%"><%
	cf.radioToken(out, "1+δ����&2+ȫ��&3+�����������&4+Ԥ�������&5+�˻������",jkxz,true);
%>��<%
	cf.radioToken(out, "1+�������ֳ������&2+�����տ�&3+��˾�����տ�",jkdd,true);
%></td>
      <td width="18%" align="right">��ĿרԱ</td>
      <td width="26%"><%=xmzy%></td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right"> 
        פ��Ҿӹ���      </td>
      <td width="40%"> <%=clgw%> </td>
      <td width="18%" align="right"> 
        չ���Ҿӹ���      </td>
      <td width="26%"><%=ztjjgw%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right">�������־</td>
      <td width="40%"><%
	cf.selectToken(out,"1+�������&2+�ȴ�����֪ͨ&3+������֪ͨ&4+�Ѳ���",xclbz,true);
%></td>
      <td width="18%" align="right">�ƻ�����ʱ��</td>
      <td width="26%"><%=jhclsj%></td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right"> 
        �ȴ��ͻ�֪ͨ      </td>
      <td width="40%"><%
	cf.selectToken(out,"1+�������&2+����δ֪ͨ&3+������֪ͨ",ddshbz,true);
%> </td>
      <td width="18%" align="right"> 
        ��ͬ�ͻ�ʱ��      </td>
      <td width="26%"><%=ddhtshsj%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right"> 
        ǩ��ͬʱ��      </td>
      <td width="40%"><%=qhtsj%> </td>
      <td width="18%" align="right"> 
        �ɼ����ֹʱ��      </td>
      <td width="26%"><%=kjxsj%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right"> 
        ��ͬ�ܶ�      </td>
      <td width="40%"> <%=hkze%> </td>
      <td width="18%" align="right"> 
        ��������      </td>
      <td width="26%"><%=zjhze%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right"> 
        �������ܶ�      </td>
      <td width="40%"><%=cf.formatDouble(hkze+zjhze)%> </td>
      <td width="18%" align="right"> 
        �����������      </td>
      <td width="26%"><%=htcxhdje%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right">��ͬ��ע</td>
      <td colspan="3"><%=ddbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">���Ĵ���</font></td>
      <td width="40%"><%=zcdlbm%></td>
      <td width="18%" align="right"><font color="#0000CC"></font><font color="#0000CC">����С��</font></td>
      <td width="26%"><%=zcxlbm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000CC">Ʒ��</font></td>
      <td width="40%"><%=ppbm%></td>
      <td width="18%" align="right">�������ۿ�</td>
      <td width="26%"><%=zjxzkl%><b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right">���������ԭ��</td>
      <td colspan="3"><%=dzyy%></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><strong>��ǰ����������Ϸ�</strong></td>
      <td><%=zqzjxclf%></td>
      <td align="right"><strong>�ۺ���������Ϸ�</strong></td>
      <td><%=zhzjxclf%></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right" bgcolor="#FFFFCC"><strong>������Զ�̷�</strong></td>
      <td><%=zjxycf%></td>
      <td align="right"><strong>������������</strong></td>
      <td><%=zjxqtf%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><strong>��ǰ�������ܶ�</strong></td>
      <td bgcolor="#FFFFCC"><%=zqzjxze%></td>
      <td align="right" bgcolor="#FFFFCC"><strong>�ۺ��������ܶ�</strong></td>
      <td bgcolor="#FFFFCC"><%=zjxze%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><span class="STYLE2"><strong>������ɱ��ܶ�</strong></span></td>
      <td bgcolor="#FFFFCC"><%=zjxcbze%></td>
      <td align="right" bgcolor="#FFFFCC"><strong>������������</strong></td>
      <td bgcolor="#FFFFCC"><%=zjxcxhdje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right">������ԭ��</td>
      <td width="40%"> 
        <%
	cf.selectItem(out,"select zczjxyybm,zczjxyymc from jdm_zczjxyybm order by zczjxyybm",zczjxyybm,true);
%>       </td>
      <td width="18%" align="right">��ͬ�ͻ�ʱ��</td>
      <td width="26%"><%=htshsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�������ʱ��      </td>
      <td width="40%"><%=zjxfssj%></td>
      <td width="18%" align="right"><font color="#0000CC">¼����</font>      </td>
      <td width="26%"><%=lrr%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000CC">¼��ʱ��</font>      </td>
      <td width="40%"><%=lrsj%></td>
      <td width="18%" align="right"><font color="#0000CC">¼�벿��</font>      </td>
      <td width="26%"> 
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>         </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="80" rows="2"><%=bz%></textarea>      </td>
    </tr>
    <tr> 
      <td height="2" colspan="4" align="center"> 
		<input type="hidden" name="ddlx" value="<%=ddlx%>" >
          <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
      <input type="hidden" name="zjxbh"  value="<%=zjxbh%>" >
	  <input type="button"  value="�����޸Ľ������" onClick="f_plxg(editform)" >
	  <input type="button"  value="�����޸Ľ������" onClick="f_zxxg(editform)"  >
      <input type="button"  value="������" onClick="f_wc(editform)" name="wc" ></td>
    </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_plxg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	FormName.action="PlLrJsblJc_zczjxmx.jsp";
	FormName.submit();
//	FormName.wc.disabled=false;
	return true;
}

function f_zxxg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	FormName.action="Jc_zczjxmxLrJsblList.jsp";
	FormName.submit();
//	FormName.wc.disabled=false;
	return true;
}
function f_wc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}

	FormName.action="WcSxhtsh.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
