<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String xmbh=null;
String xmmc=null;
String jldwmc=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sjs=null;
String bjjb=null;

double zjqye=0;

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

	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	zjqye=dzbj.getBjje(conn,khbh,"hd");


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>ʩ����Ԥ������ϸ</b> 
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

<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%" >���</td>
    <td  width="4%" >����</td>
    <td  width="7%" >��Ŀ���</td>
    <td  width="14%" >��Ŀ����</td>
    <td  width="4%" >��λ</td>
    <td  width="5%" >����</td>
    <td  width="5%" >���ⵥ��</td>
    <td  width="6%" >������</td>
    <td  width="5%" >���۵���</td>
    <td  width="6%" >���۽��</td>
    <td  width="5%" >ë����</td>
    <td  width="6%" >ë�����</td>
    <td  width="5%" bgcolor="#CCFFFF" ><font color="#000000">�������ϵ��</font></td>
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

	double xjdwbjje=0;
	double xjcbje=0;
	double xjmll=0;
	double xjmle=0;
	double xjnbjsje=0;
	double xjgsmll=0;
	double xjgsmlr=0;

	//�����Ŀ��ϸ
	ls_sql="SELECT xmbh,xh,xmmc,jldwmc,sl,dwbjdj,dwbjje,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,clfbfb,bjlx,DECODE(bjlx,'1','��׼','2','�Զ���') bjlxmc";
	ls_sql+=" from cw_deyjsmx,jdm_jldwbm ";
	ls_sql+=" where cw_deyjsmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and cw_deyjsmx.khbh='"+khbh+"'";
	ls_sql+=" order by bjlx desc,cw_deyjsmx.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xh=rs.getInt("xh");
		xmmc=rs.getString("xmmc");
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
		bjlxmc=rs.getString("bjlxmc");

		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
		{
			xsclfbfb="&nbsp;";
		}
		else{
			xsclfbfb=clfbfb+"%";
		}


		xjdwbjje+=dwbjje;
		xjcbje+=cbje;
		xjmle+=mle;
		xjnbjsje+=nbjsje;
		xjgsmlr+=gsmlr;

		
		//���ÿ������
		%> 
  <tr bgcolor="#FFFFFF" align="center"> 
    <td ><%=xh%></td>
    <td ><%=bjlxmc%></td>
    <td ><%=xmbh%> </td>
    <td ><%=xmmc%> </td>
    <td ><%=jldwmc%> </td>
    <td ><%=sl%> </td>
    <td ><%=dj%> </td>
    <td ><%=dwbjje%> </td>
    <td><%=cbdj%> </td>
    <td><%=cbje%> </td>
    <td><%=mll%>% </td>
    <td><%=mle%> </td>
    <td bgcolor="#CCFFFF"><font color="#000000"><%=jsblxs%>% </font></td>
    <td><%=nbjsdj%></td>
    <td><%=nbjsje%></td>
    <td><%=gsmll%>%</td>
    <td><%=gsmlr%></td>
  </tr>
  <%

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
    <td><%=xjcbje%></td>
    <td><%=xjmll%>%</td>
    <td><%=xjmle%></td>
    <td bgcolor="#CCFFFF" >&nbsp;</td>
    <td >&nbsp;</td>
    <td><%=xjnbjsje%></td>
    <td><%=xjgsmll%>%</td>
    <td><%=xjgsmlr%></td>
  </tr>
</table>
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
