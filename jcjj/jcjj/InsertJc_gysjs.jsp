<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] ddbh=request.getParameterValues("ddbh");
String ssfgs=request.getParameter("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
double cbzj=0;
double ycfzj=0;
double qtfzj=0;
double hkze=0;
double jsje=0;
String gys=null;
String ppbm=null;
try {
	conn=cf.getConnection();

	int ddgyssl=0;
	ls_sql =" select count(distinct gys)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ddgyssl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (ddgyssl>1)
	{
		out.println("���󣡲���ͬһ��Ӧ�̶���");
		return;
	}

	int ddppsl=0;
	ls_sql =" select count(distinct ppbm)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ddppsl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (ddppsl>1)
	{
		out.println("���󣡲���ͬһƷ��");
		return;
	}


	int isShMark=0;
	String jcddbh=null;
	String jcppbm=null;
	ls_sql =" select ddbh,ppbm";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jcddbh=rs.getString("ddbh");
		jcppbm=rs.getString("ppbm");

		String getdsksjbz=null;
		String getfkxh=null;
		String getkhbh=null;
		String fkkhxm=null;
		String fkfwdz=null;
		String getdwmc=null;
		ls_sql =" select fkxh,dsksjbz,khbh,fkkhxm,fkfwdz,dwmc";
		ls_sql+=" from cw_khfkjl,sq_dwxx";
		ls_sql+=" where cw_khfkjl.ddbh='"+jcddbh+"' and scbz='N' and skdd='2'";//1��������ˣ�2�������
		ls_sql+=" and cw_khfkjl.dsksjbz!='Y'";//N: δ��ˣ�Y: ���ͨ����M:���δͨ��
		ls_sql+=" and cw_khfkjl.dwbh=sq_dwxx.dwbh(+)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getfkxh=rs1.getString("fkxh");
			getdsksjbz=rs1.getString("dsksjbz");
			getkhbh=rs1.getString("khbh");
			fkkhxm=rs1.getString("fkkhxm");
			fkfwdz=rs1.getString("fkfwdz");
			getdwmc=rs1.getString("dwmc");

			isShMark++;

			out.println("<BR>������"+jcddbh+"�������տ���š�"+getfkxh+"��δ���:���ͻ����:"+getkhbh+"��������:"+fkkhxm+"������ַ:"+fkfwdz+"��������:"+getdwmc+"��");
		}
		rs1.close();
		ps1.close();
	
	
	}
	rs.close();
	ps.close();


	ls_sql =" select distinct gys,ppbm";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		gys=rs1.getString(1);
		ppbm=rs1.getString(2);
	}
	rs1.close();
	ps1.close();



	
	ls_sql="update jc_zcdd set cbze=round(zcpclf*fdbl/100+tjpclf*tjpfdbl/100,2)";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql =" select sum(cbze),sum(round(ycf*ycfjsbl/100,2)),sum(round(qtf*azfjsbl/100,2)),sum(wdzje)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		cbzj=rs1.getDouble(1);
		ycfzj=rs1.getDouble(2);
		qtfzj=rs1.getDouble(3);
		hkze=rs1.getDouble(4);
	}
	rs1.close();
	ps1.close();


	jsje=cbzj+ycfzj+qtfzj;
	jsje=cf.round(jsje,2);




%>


<CENTER >
  <B><font size="3">�����ڴＯ�ɼҾ������̻����㵥</font></B>
</CENTER>

<form method="post" action="" name="editform" >
<div align="center">���̽��㣨��Ӧ�̣�<%=gys%>��Ʒ�ƣ�<%=ppbm%>��</div> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">������˾</font></td>
      <td bgcolor="#FFFFFF"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
          <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
      </select></td>
      <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    
    <tr bgcolor="#CCCCFF">
      <td width="18%" align="right" bgcolor="#FFFFFF"> <font color="#FF0000">*</font><font color="#0000CC">������</font> </td>
      <td width="32%" bgcolor="#FFFFFF"><input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF"> <font color="#FF0000">*</font>����ʱ�� </td>
      <td width="32%" bgcolor="#FFFFFF"><input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">���ϳɱ�</font></td>
      <td><input type="text" name="cbzj" value="<%=cbzj%>" size="20" maxlength="20" readonly/></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">Զ�̷�</font></td>
      <td><input type="text" name="ycfzj" value="<%=ycfzj%>" size="20" maxlength="20" readonly/></td>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������</font></td>
      <td><input type="text" name="qtfzj" value="<%=qtfzj%>" size="20" maxlength="20" readonly/></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�۳�����</td>
      <td><input type="text" name="kcfy" value="0" size="20" maxlength="20" onChange="f_jsjg(editform)"/></td>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������</font></td>
      <td><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="20" readonly/></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF">����˵��</td>
      <td colspan="3"><textarea name="jssm" cols="71" rows="3"></textarea></td>
    </tr>
    <tr> 
      <td colspan="4" align="center">
<%
	for (int i=0;i<ddbh.length ;i++ )
	{
		%>
          <input type="hidden" name="ddbh"  value="<%=ddbh[i]%>" >
		<%
	}
%>
			<input type="hidden" name="gys"  value="<%=gys%>" >          
			<input type="hidden" name="ppbm"  value="<%=ppbm%>" >          
			<input type="button"  value="����" onClick="f_do(editform)"  <%if (isShMark>0) out.println("disabled");%>>
			<input type="reset"  value="����" name="reset"></td>
    </tr>
  </table>
</form>

<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center" height="23">
	<td  width="4%">�������</td>
	<td  width="4%">����</td>
	<td  width="4%">����</td>
	<td  width="6%">����</td>
	<td  width="4%">����Ա</td>
	<td  width="4%">��������</td>
	<td  width="6%">��������</td>
	<td  width="6%">��ƷƷ��</td>
	<td  width="5%">���ۺ�ͬ��</td>
	<td  width="5%">����Ʒ���Ϸ�</td>
	<td  width="5%">�ؼ�Ʒ���Ϸ�</td>
	<td  width="5%">��װ��</td>
	<td  width="5%">Զ�̷�</td>
	<td  width="5%">ʵ�ʽ���</td>
	<td  width="4%">����Ʒ�������</td>
	<td  width="4%">�ؼ�Ʒ�������</td>
	<td  width="4%">��װ�ѽ������</td>
	<td  width="4%">Զ�̷ѽ������</td>
	<td  width="5%">������</td>
	<td  width="6%">��Ʒ����</td>
	<td  width="223%">��ע</td>
</tr>
  <%

	String bjjbmc=null;
	String getkhxm=null;
	String zcdlbm=null;
	String getddbh=null;
	String getzcxlbm=null;
	String getppbm=null;
	String getxshth=null;
	String getddlx=null;
	double getwdzje=0;
	double gethkze=0;
	double getzqclf=0;
	double getzcpclf=0;
	double gettjpclf=0;

	double getfdbl=0;
	double gettjpfdbl=0;
	double getazfjsbl=0;
	double getycfjsbl=0;
	double getfdje=0;

	double getfkje=0;
	double getqtf=0;
	double getycf=0;
	String getqhtsj=null;
	String getbz=null;
	String getdwmc=null;
	String getclgw=null;

	double allwdzje=0;
	double allhkze=0;
	double allzqclf=0;
	double allzcpclf=0;
	double alltjpclf=0;
	double allfdje=0;
	double allqtf=0;
	double allycf=0;
	double allfkje=0;

	ls_sql="SELECT bjjbmc,crm_khxx.khxm,dwmc,jc_zcdd.clgw,jc_zcdd.ddbh,zcxlbm,ppbm,jc_zcdd.xshth,jc_zcdd.wdzje,jc_zcdd.qhtsj ";
	ls_sql+=" ,jc_zcdd.hkze,jc_zcdd.zqclf,jc_zcdd.zcpclf,jc_zcdd.tjpclf,jc_zcdd.fdbl,jc_zcdd.tjpfdbl,round(jc_zcdd.zcpclf*jc_zcdd.fdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpfdbl/100,2)+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2) fdje,jc_zcdd.bz,jc_zcdd.qtf,jc_zcdd.ycf,decode(jc_zcdd.ddlx,'9','����','E','ɢ��')ddlx,jc_zcdd.zcdlbm";
	ls_sql+=" ,jc_zcdd.azfjsbl,jc_zcdd.ycfjsbl";
	ls_sql+=" FROM jc_zcdd,crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.ddlx in('9','E')";//9�����ɼҾ�����;E;ɢ��
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)"; 
	ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zcdd.ddbh");
	ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		getdwmc=cf.fillNull(rs.getString("dwmc"));
		getclgw=cf.fillHtml(rs.getString("clgw"));
		getkhxm=cf.fillNull(rs.getString("khxm"));
		getddbh=cf.fillNull(rs.getString("ddbh"));
		getzcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		getppbm=cf.fillNull(rs.getString("ppbm"));
		zcdlbm=cf.fillHtml(rs.getString("zcdlbm"));

		getxshth=cf.fillNull(rs.getString("xshth"));
		getwdzje=rs.getDouble("wdzje");
		gethkze=rs.getDouble("hkze");
		getzqclf=rs.getDouble("zqclf");
		getzcpclf=rs.getDouble("zcpclf");
		gettjpclf=rs.getDouble("tjpclf");
		getfdbl=rs.getDouble("fdbl");
		gettjpfdbl=rs.getDouble("tjpfdbl");
		getfdje=rs.getDouble("fdje");
		getddlx=cf.fillNull(rs.getString("ddlx"));
		getazfjsbl=rs.getDouble("azfjsbl");
		getycfjsbl=rs.getDouble("ycfjsbl");

		getqhtsj=cf.fillNull(rs.getDate("qhtsj"));
		getbz=cf.fillHtml(rs.getString("bz"));
		getqtf=rs.getDouble("qtf");
		getycf=rs.getDouble("ycf");

		allwdzje+=getwdzje;
		allwdzje=cf.round(allwdzje,2);
		allhkze+=gethkze;
		allhkze=cf.round(allhkze,2);
		allfdje+=getfdje;
		allfdje=cf.round(allfdje,2);
		allzqclf+=getzqclf;
		allzqclf=cf.round(allzqclf,2);

		allzcpclf+=getzcpclf;
		allzcpclf=cf.round(allzcpclf,2);
		alltjpclf+=gettjpclf;
		alltjpclf=cf.round(alltjpclf,2);
		
		allqtf+=getqtf;
		allqtf=cf.round(allqtf,2);
		allycf+=getycf;
		allycf=cf.round(allycf,2);

		ls_sql=" select sum(fkje) ";
		ls_sql+=" from cw_khfkjl";
		ls_sql+=" where ddbh='"+getddbh+"' and fklxbm='23' and scbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			getfkje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		allfkje+=getfkje;
		allfkje=cf.round(allfkje,2);

		%>
		<tr bgcolor="#FFFFF"  align="center" height="23">
			<td><%=getddbh%></td>
			<td><%=getkhxm%></td>
			<td><%=bjjbmc%></td>
			<td><%=getdwmc%></td>
			<td><%=getclgw%></td>
			<td><%=getddlx%></td>
			<td><%=getqhtsj%></td>
			<td><%=getppbm%></td>
			<td><%=getxshth%></td>
			<td><%=getzcpclf%></td>
			<td><%=gettjpclf%></td>
			<td><%=getqtf%></td>
			<td><%=getycf%></td>
			<td><%=getfkje%></td>
			<td><%=getfdbl%>%</td>
			<td><%=gettjpfdbl%>%</td>
			<td><%=getazfjsbl%>%</td>
			<td><%=getycfjsbl%>%</td>
			<td><%=getfdje%></td>
			<td><%=zcdlbm%></td>
			<td><%=getbz%></td>
		</tr>
		<%

	 }
	 rs.close();
	 ps.close();
%> 
	<tr bgcolor="#FFFFF"  align="center" height="23">
		<td colspan="2">�� ��</td>
		<td colspan="6">&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allzcpclf%></td>
		<td><%=alltjpclf%></td>
		<td><%=allqtf%></td>
		<td><%=allycf%></td>
		<td><%=allfkje%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allfdje%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>

<%
	if ((int)(cbzj+ycfzj+qtfzj)!=(int)allfdje)
	{
		out.println("<B><font color=\"#FF0000\">������ϸ["+allfdje+"]����ܽ��["+(cbzj+ycfzj+qtfzj)+"]��һ��</B></font>");
		return;
	}

}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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

</table>


</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsjg(FormName)//����FormName:Form������
{
	var jsje=<%=jsje%>-FormName.kcfy.value*1.0;
	jsje=round(jsje,2);

	FormName.jsje.value=jsje;

}
function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[������˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	if(	javaTrim(FormName.jsr)=="") {
		alert("��ѡ��[������]��");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("��ѡ��[����ʱ��]��");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.kcfy)=="") {
		alert("��ѡ��[�۳�����]��");
		FormName.kcfy.focus();
		return false;
	}
	if(!(isFloat(FormName.kcfy, "�۳�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("��ѡ��[������]��");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "������"))) {
		return false;
	}

	FormName.action="SaveInsertJc_gysjs.jsp";
	FormName.submit();
	return true;
}
function f_dy(FormName)//����FormName:Form������
{
	FormName.action="DyJc_gysjs.jsp";
	FormName.submit();
	return true;
}
function f_szbz(FormName)//����FormName:Form������
{
	FormName.action="chooseJs.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
