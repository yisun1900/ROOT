<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");
String gdjsjlh=request.getParameter("gdjsjlh");
String zjxxh=request.getParameter("zjxxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String xmbh=null;
String xmmc=null;
String jldwbm=null;
String jldwmc=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sjs=null;
String bjjb=null;

double zjqye=0;

double xjdwbjje=0;
double xjcbje=0;
double xjmll=0;
double xjmle=0;
double xjnbjsje=0;
double xjgsmll=0;
double xjgsmlr=0;

int row=1;

try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

	if (zjxxh.equals(""))
	{
		dzbj.Dzbj dzbj=new dzbj.Dzbj();
		zjqye=dzbj.getBjje(conn,khbh,"hd");
	}
	else{
		dzbj.Dzbj dzbj=new dzbj.Dzbj();
		zjqye=dzbj.getZjxHBjje(conn,khbh,zjxxh,"hd");
	}


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>�����������ϵ��</b> 
  <hr>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>�ͻ�������<%=khxm%></td>
    <td>��ϵ��ʽ��<%=lxfs%> </td>
    <td>����ܼƣ�<%=cf.formatDouble(zjqye,"#########.##")%>Ԫ</td>
  </tr>
  <tr> 
    <td>���̵ص㣺<%=fwdz%></td>
    <td>�� �� ʦ��<%=sjs%></td>
    <td>���̵ȼ���<%=bjjb%></td>
  </tr>
</table>

<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="<%=khbh%>" >
<input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="18" > 
		  <input type=button value='�޸Ľ���' onClick="cf_submit(listform)" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value='�鿴������ϸ' onClick="window.open('ViewCw_dejsclmx.jsp?khbh=<%=khbh%>')" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value='�鿴���۵���' onClick="window.open('ViewCw_dejsxmclmx.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')" >

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		���������ϵ��������Ϊ��<input type="text" name="tzjsblxs" value="" size="8" maxlength="12" >%
		<input type="button" value='��ʼ����' onClick="f_tzjsbl(listform)" >
      </td>
  </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%" >���</td>
    <td  width="4%" >����</td>
    <td  width="6%" >��Ŀ���</td>
    <td  width="14%" >��Ŀ����</td>
    <td  width="4%" >��λ</td>
    <td  width="5%" >����</td>
    <td  width="5%" >���ⵥ��</td>
    <td  width="6%" >������</td>
    <td  width="5%" >�Զ�����Ŀ�ɱ��ٷֱ�</td>
    <td  width="5%" >���۵���</td>
    <td  width="6%" >���۽��</td>
    <td  width="5%" >ë����</td>
    <td  width="6%" >ë�����</td>
    <td  width="5%" >�������ϵ��</td>
    <td  width="5%" >�ڲ����㵥��</td>
    <td  width="6%" >�ڲ�������</td>
    <td  width="5%" >��˾ë����</td>
    <td  width="6%" >��˾ë����</td>
  </tr>

<%
	int xh=0;

	double dj=0;
	double sl=0;
	double dwbjje=0;

	double cbdj=0;
	double cbje=0;
	double mll=0;
	double mle=0;
	double nbjsdj=0;
	double nbjsje=0;
	double gsmll=0;
	double gsmlr=0;
	double jsblxs =0;
	double clfbfb =0;
	String xsclfbfb="";//���ӱ������޹��Ϸ�����Ĭ�ϲ��ϷѰٷֱ�

	String bjlx=null;
	String bjlxmc=null;

	//�����Ŀ��ϸ
	ls_sql="SELECT xmbh,xh,xmmc,cw_dejsmx.jldwbm,jldwmc,sl,dwbjdj,dwbjje,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,clfbfb,bjlx ";
	ls_sql+=" from cw_dejsmx,jdm_jldwbm ";
	ls_sql+=" where cw_dejsmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and cw_dejsmx.khbh='"+khbh+"'";
	ls_sql+=" order by cw_dejsmx.xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xh=rs.getInt("xh");
		xmmc=rs.getString("xmmc");
		jldwbm=cf.fillHtml(rs.getString("jldwbm"));
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dwbjdj");
		dwbjje=rs.getDouble("dwbjje");
		cbdj=rs.getDouble("cbdj");
		cbje=rs.getDouble("cbje");
		mll=rs.getDouble("mll");
		mle=rs.getDouble("mle");
		jsblxs=rs.getDouble("jsblxs");
		nbjsdj=rs.getDouble("nbjsdj");
		nbjsje=rs.getDouble("nbjsje");
		gsmll=rs.getDouble("gsmll");
		gsmlr=rs.getDouble("gsmlr");
		clfbfb=rs.getDouble("clfbfb");
		bjlx=rs.getString("bjlx");

		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
		{
			bjlxmc="��׼";
			xsclfbfb="";
		}
		else{
			bjlxmc="�Զ���";
			xsclfbfb=clfbfb+"";
		}


		xjdwbjje+=dwbjje;
		xjcbje+=cbje;
		xjmle+=mle;
		xjnbjsje+=nbjsje;
		xjgsmlr+=gsmlr;

		
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=bjlxmc%>
				<input type="hidden" name="bjlx" value="<%=bjlx%>" >
			</td>
			<td ><%=xmbh%>
				<input type="hidden" name="xmbh" value="<%=xmbh%>" >
			</td>
			<td ><%=xmmc%>
				<input type="hidden" name="xmmc" value="<%=xmmc%>" >
			</td>
			<td ><%=jldwmc%>
				<input type="hidden" name="jldwbm" value="<%=jldwbm%>" >
			</td>
			<td ><%=sl%>
				<input type="hidden" name="sl" value="<%=sl%>" >
			</td>
			<td ><%=dj%>
				<input type="hidden" name="dj" value="<%=dj%>" >
			</td>
			<td ><%=dwbjje%>
				<input type="hidden" name="dwbjje" value="<%=dwbjje%>" >
			</td>
			<td>
<%
			if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
			{
				%>
				<%=xsclfbfb%>
				<input type="hidden" name="clfbfb" value="<%=xsclfbfb%>" >
				<%
			}
			else{
				%>
				<input type="text" name="clfbfb" size="6" value="<%=xsclfbfb%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_jsjg(listform,<%=(row-1)%>)">
				%
				<%
			}
%>
			</td>
			<td>
				<input type="text" name="cbdj" size="8" value="<%=cbdj%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="cbje" size="10" value="<%=cbje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="mll" size="6" value="<%=mll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
				%
			</td>
			<td>
				<input type="text" name="mle" size="10" value="<%=mle%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="jsblxs" size="6" value="<%=jsblxs%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_tzxs(listform,<%=(row-1)%>)">
				%
			</td>
			<td>
				<input type="text" name="nbjsdj" size="8" value="<%=nbjsdj%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="nbjsje" size="10" value="<%=nbjsje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="gsmll" size="6" value="<%=gsmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
				%
			</td>
			<td>
				<input type="text" name="gsmlr" size="10" value="<%=gsmlr%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
		  </tr>
		
		
		<%

		row++;
	}
	rs.close();
	ps.close();

	if (xjdwbjje==0)
	{
		out.println("������");
		return;
	}

	xjdwbjje=cf.doubleTrim(xjdwbjje);
	xjcbje=cf.doubleTrim(xjcbje);
	xjmle=cf.doubleTrim(xjmle);
	xjnbjsje=cf.doubleTrim(xjnbjsje);
	xjgsmlr=cf.doubleTrim(xjgsmlr);

	xjmll=(xjdwbjje-xjcbje)/xjdwbjje*100;//�����ⱨ�۽��ɱ���/���۽��
	xjmll=cf.doubleTrim(xjmll);
	xjgsmll=(xjdwbjje-xjnbjsje)/xjdwbjje*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
	xjgsmll=cf.doubleTrim(xjgsmll);
%>	
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="4">�ϼ�</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=xjdwbjje%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td>
		<input type="text" name="xjcbje" size="10" value="<%=xjcbje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td>
		<input type="text" name="xjmll" size="6" value="<%=xjmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
		%
	</td>
	<td>
		<input type="text" name="xjmle" size="10" value="<%=xjmle%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td>
		<input type="text" name="xjnbjsje" size="10" value="<%=xjnbjsje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td>
		<input type="text" name="xjgsmll" size="6" value="<%=xjgsmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
		%
	</td>
	<td>
		<input type="text" name="xjgsmlr" size="10" value="<%=xjgsmlr%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
    </tr>
  </tr>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="18" > 
		  <input type=button value='�޸Ľ���' onClick="cf_submit(listform)" name="jsblxs">
      </td>
  </tr>
</table>
</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function cf_submit(formName)
{
	formName.action="SaveEditCw_dejsmx.jsp";
	formName.submit();
	return true;
} 
//�޸ģ��Զ�����Ŀ�ɱ��ٷֱ�
function f_jsjg(FormName,xh)
{
	var cbdj=0;//���۵���=���ⵥ��*�Զ�����Ŀ�ɱ��ٷֱ�
	cbdj=FormName.dj[xh].value*FormName.clfbfb[xh].value/100.0;
	cbdj=round(cbdj,2);
	FormName.cbdj[xh].value=cbdj;

	var cbje=0;//���۽��=���۵���*����
	cbje=FormName.sl[xh].value*FormName.cbdj[xh].value;
	cbje=round(cbje,2);
	FormName.cbje[xh].value=cbje;

	var mll=0;//ë����=�����ⱨ�۽����۽�*100/���ⱨ�۽��
	mll=(FormName.dwbjje[xh].value*1.0-FormName.cbje[xh].value*1.0)*100/FormName.dwbjje[xh].value;
	mll=round(mll,2);
	FormName.mll[xh].value=mll;

	var mle=0;//ë�����=ë����*���ⱨ�۽��
	mle=FormName.dwbjje[xh].value*1.0-FormName.cbje[xh].value*1.0;
	mle=round(mle,2);
	FormName.mle[xh].value=mle;

	var nbjsdj=0;//�ڲ����㵥��=���۵���*(1+�������ϵ��)
	nbjsdj=FormName.cbdj[xh].value*(1+FormName.jsblxs[xh].value/100.0);
	nbjsdj=round(nbjsdj,2);
	FormName.nbjsdj[xh].value=nbjsdj;

	var nbjsje=0;//�ڲ�������=�ڲ����㵥��*��������
	nbjsje=FormName.nbjsdj[xh].value*FormName.sl[xh].value;
	nbjsje=round(nbjsje,2);
	FormName.nbjsje[xh].value=nbjsje;

	var gsmll=0;//��˾ë����=�����ⱨ�۽��ڲ������*100/���ⱨ�۽��
	gsmll=(FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0)*100/FormName.dwbjje[xh].value;
	gsmll=round(gsmll,2);
	FormName.gsmll[xh].value=gsmll;

	var gsmlr=0;//��˾ë����=��˾ë����*���ⱨ�۽��
	gsmlr=FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0;
	gsmlr=round(gsmlr,2);
	FormName.gsmlr[xh].value=gsmlr;

	f_jsxj(FormName);

} 


//�޸ģ��������ϵ��
function f_tzxs(FormName,xh)
{
	var nbjsdj=0;//�ڲ����㵥��=���۵���*(1+�������ϵ��)
	nbjsdj=FormName.cbdj[xh].value*(1+FormName.jsblxs[xh].value/100.0);
	nbjsdj=round(nbjsdj,2);
	FormName.nbjsdj[xh].value=nbjsdj;

	var nbjsje=0;//�ڲ�������=�ڲ����㵥��*��������
	nbjsje=FormName.nbjsdj[xh].value*FormName.sl[xh].value;
	nbjsje=round(nbjsje,2);
	FormName.nbjsje[xh].value=nbjsje;

	var gsmll=0;//��˾ë����=�����ⱨ�۽��ڲ������*100/���ⱨ�۽��
	gsmll=(FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0)*100/FormName.dwbjje[xh].value;
	gsmll=round(gsmll,2);
	FormName.gsmll[xh].value=gsmll;

	var gsmlr=0;//��˾ë����=��˾ë����*���ⱨ�۽��
	gsmlr=FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0;
	gsmlr=round(gsmlr,2);
	FormName.gsmlr[xh].value=gsmlr;

	f_jsxj(FormName);

} 

//���¼���С��
function f_jsxj(FormName)
{
	var xjdwbjje=<%=xjdwbjje%>;
	var xjcbje=0;
	var xjmle=0;
	var xjnbjsje=0;
	var xjgsmlr=0;
	for (var i=0;i< <%=(row-1)%> ;i++ )
	{
		xjcbje=xjcbje+FormName.cbje[i].value*1.0
		xjmle=xjmle+FormName.mle[i].value*1.0
		xjnbjsje=xjnbjsje+FormName.nbjsje[i].value*1.0
		xjgsmlr=xjgsmlr+FormName.gsmlr[i].value*1.0
	}

	xjcbje=round(xjcbje,2);
	FormName.xjcbje.value=xjcbje;
	xjmle=round(xjmle,2);
	FormName.xjmle.value=xjmle;
	xjnbjsje=round(xjnbjsje,2);
	FormName.xjnbjsje.value=xjnbjsje;
	xjgsmlr=round(xjgsmlr,2);
	FormName.xjgsmlr.value=xjgsmlr;

	var xjmll=(xjdwbjje-xjcbje)/xjdwbjje*100;//�����ⱨ�۽��ɱ���/���۽��
	xjmll=round(xjmll,2);
	FormName.xjmll.value=xjmll;
	var xjgsmll=(xjdwbjje-xjnbjsje)/xjdwbjje*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
	xjgsmll=round(xjgsmll,2);
	FormName.xjgsmll.value=xjgsmll;

} 



function f_tzjsbl(FormName)
{
	if(	javaTrim(FormName.tzjsblxs)=="") {
		alert("������[�����������ϵ��]��");
		FormName.tzjsblxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tzjsblxs, "�����������ϵ��"))) {
		return false;
	}

	for (var i=0;i< <%=(row-1)%> ;i++ )
	{
		FormName.jsblxs[i].value=FormName.tzjsblxs.value;
		f_tzxs(FormName,i);
	}
} 

//-->
</script>

