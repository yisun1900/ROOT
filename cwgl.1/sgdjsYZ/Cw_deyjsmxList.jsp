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
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=1;

String dqbm=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwbm=null;
String jldwmc=null;
String gycl=null;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String bjlx=null;

double clfbfb=0;//���ӱ������޹��Ϸ�����Ĭ�ϲ��ϷѰٷֱ�
double zjqye=0;

double allcbje=0;
double jsblxs=0;


try {
	conn=cf.getConnection();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
    ls_sql+=" where csbm='clfbfb'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clfbfb=rs.getDouble("csz");
	}
	else{
		out.println("�����ڱ�sq_xtcsb����Ĭ�ϲ��ϷѰٷֱ�");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
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
	zjqye=dzbj.getBjje(conn,khbh,"yz");


	ls_sql="SELECT sum(bj_gclmx.sl*bj_khglfxb.xhl*bj_khglfxb.dj) je";
	ls_sql+=" FROM bj_khglfxb,bj_gclmx  ";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_khglfxb.khbh=bj_gclmx.khbh and bj_khglfxb.dqbm=bj_gclmx.dqbm and bj_khglfxb.xmbh=bj_gclmx.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcbje=rs.getDouble("je");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj) je";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx  ";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and bj_gclmx.xmbh not in(select xmbh from bj_khglfxb where bj_khglfxb.khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcbje+=rs.getDouble("je")*clfbfb/100;
	}
	rs.close();
	ps.close();



	ls_sql="select jsbl";
	ls_sql+=" from  cw_dejsglfl";
	ls_sql+=" where  qsz<="+allcbje+" and "+allcbje+"<jzz";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsblxs=rs.getDouble("jsbl");
	}
	rs.close();
	ps.close();


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

<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="<%=khbh%>" >
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="16" > 
		  <input type=button value='Ԥ����' onClick="cf_submit(listform)">
      </td>
    </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="3%" >���</td>
    <td  width="6%" >��Ŀ���</td>
    <td  width="14%" >��Ŀ����</td>
    <td  width="5%" >��λ</td>
    <td  width="5%" >����</td>
    <td  width="5%" >���ⵥ��</td>
    <td  width="7%" >������</td>
    <td  width="5%" >���۵���</td>
    <td  width="7%" >���۽��</td>
    <td  width="5%" >ë����</td>
    <td  width="7%" >ë�����</td>
    <td  width="7%" >�������ϵ��</td>
    <td  width="5%" >�ڲ����㵥��</td>
    <td  width="7%" >�ڲ�������</td>
    <td  width="5%" >��˾ë����</td>
    <td  width="7%" >��˾ë����</td>
  </tr>

<%
	int i=0;

	double dj=0;
	double sl=0;
	double qye=0;

	double xjqye=0;
	double xjcbje=0;
	double xjmll=0;
	double xjmle=0;
	double xjnbjsje=0;
	double xjgsmll=0;
	double xjgsmlr=0;

	//�����Ŀ��ϸ
	ls_sql="SELECT bj_bjxmmx.xmpx,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.bjlx,bj_bjxmmx.xmmc,bj_bjxmmx.jldwbm,jldwmc,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx  ";
	ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" group by bj_bjxmmx.xmpx,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.bjlx,bj_bjxmmx.xmmc,bj_bjxmmx.jldwbm,jldwmc,bj_bjxmmx.dj";
	ls_sql+=" order by bj_bjxmmx.xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		dqbm=rs.getString("dqbm");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		bjlx=rs.getString("bjlx");
		jldwbm=rs.getString("jldwbm");
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		qye=rs.getDouble("je");


		double cbdj=0;
		double cbje=0;
		double mll=0;
		double mle=0;
		double nbjsdj=0;
		double nbjsje=0;
		double gsmll=0;
		double gsmlr=0;

		//�жϹ������Ƿ�Ϊ0
		if (sl>0)
		{
			ls_sql="SELECT sum(xhl*dj)";
			ls_sql+=" FROM bj_khglfxb  ";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.dqbm='"+dqbm+"' and bj_khglfxb.xmbh='"+xmbh+"' ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cbdj=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			if (cbdj<=0)//�޹��Ϸ�������
			{
				cbdj=dj*clfbfb/100;
			}

			cbdj=cf.doubleTrim(cbdj,2);

			cbje=sl*cbdj;//������*�ɱ�����
			cbje=cf.doubleTrim(cbje);

			mll=(qye-cbje)/qye*100;//�����ⱨ�۽��ɱ���/���۽��
			mll=cf.doubleTrim(mll);

			mle=qye-cbje;//ë����*���ⱨ�۽��
			mle=cf.doubleTrim(mle);


			nbjsdj=cbdj*(1+jsblxs/100);//�ɱ�����*(1+�������ϵ��)
			nbjsdj=cf.doubleTrim(nbjsdj);

			nbjsje=nbjsdj*sl;//�ڲ����㵥��*��������
			nbjsje=cf.doubleTrim(nbjsje);

			gsmll=(qye-nbjsje)/qye*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
			gsmll=cf.doubleTrim(gsmll);

			gsmlr=qye-nbjsje;//��˾ë����*���ⱨ�۽��
			gsmlr=cf.doubleTrim(gsmlr);
		}

		xjqye+=qye;
		xjcbje+=cbje;
		xjmle+=mle;
		xjnbjsje+=nbjsje;
		xjgsmlr+=gsmlr;

		
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
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
			<td ><%=qye%>
				<input type="hidden" name="qye" value="<%=qye%>" >
			</td>
			<td><%=cbdj%>
				<input type="hidden" name="cbdj" value="<%=cbdj%>" >
			</td>
			<td><%=cbje%>
				<input type="hidden" name="cbje" value="<%=cbje%>" >
			</td>
			<td><%=mll%>%
				<input type="hidden" name="mll" value="<%=mll%>" >
			</td>
			<td><%=mle%>
				<input type="hidden" name="mle" value="<%=mle%>" >
			</td>
			<td>
				<input type="text" name="jsblxs" size="5" value="<%=jsblxs%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jsblxs[<%=(row)%>])">
				%
			</td>
			<td><%=nbjsdj%></td>
			<td><%=nbjsje%></td>
			<td><%=gsmll%>%</td>
			<td><%=gsmlr%></td>
		  </tr>
		<%
	row++;

	}
	rs.close();
	ps.close();

	xjqye=cf.doubleTrim(xjqye);
	xjcbje=cf.doubleTrim(xjcbje);
	xjmle=cf.doubleTrim(xjmle);
	xjnbjsje=cf.doubleTrim(xjnbjsje);
	xjgsmlr=cf.doubleTrim(xjgsmlr);

	xjmll=(xjqye-xjcbje)/xjqye*100;//�����ⱨ�۽��ɱ���/���۽��
	xjmll=cf.doubleTrim(xjmll);
	xjgsmll=(xjqye-xjnbjsje)/xjqye*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
	xjgsmll=cf.doubleTrim(xjgsmll);
%>	
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="4">�ϼ�</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=xjqye%></td>
	<td >&nbsp;</td>
	<td><%=xjcbje%></td>
	<td><%=xjmll%>%</td>
	<td><%=xjmle%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=xjnbjsje%></td>
	<td><%=xjgsmll%>%</td>
	<td><%=xjgsmlr%></td>
    </tr>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="16" > 
		  <input type=button value='Ԥ����' onClick="cf_submit(listform)" name="jsblxs">
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
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
	formName.action="SaveCw_deyjsmx.jsp";
	formName.submit();
	return true;
} 

//-->
</script>

