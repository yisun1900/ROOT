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
String bjlxmc=null;

double clfbfb=0;//���ӱ������޹��Ϸ�����Ĭ�ϲ��ϷѰٷֱ�
String xsclfbfb="";//���ӱ������޹��Ϸ�����Ĭ�ϲ��ϷѰٷֱ�
double zjqye=0;

double allcbje=0;
double jsblxs=0;

double xjdwbjje=0;
double xjcbje=0;
double xjmll=0;
double xjmle=0;
double xjnbjsje=0;
double xjgsmll=0;
double xjgsmlr=0;

try {
	conn=cf.getConnection();

	//ȡ���Զ�����Ŀ�ɱ��ٷֱ�
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

	//ȡ�ͻ���Ϣ
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


	//ȡ���ϳɱ������ڼ��㡾Ĭ�Ͻ�����������迼���С����Ϸ������͡��޹��Ϸ���������������������ʼ
	//�й��Ϸ���
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

	//�޹��Ϸ���
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

	//Ĭ�Ͻ������
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
	//ȡ���ϳɱ������ڼ��㡾Ĭ�Ͻ�����������迼���С����Ϸ������͡��޹��Ϸ�����==========���


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>ʩ����Ԥ����-->����������Ŀ</b> 
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
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="19" > 
		<input type=button value='ȷ�������������ϵ��' onClick="cf_submit(listform)">
      </td>
    </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%" >���</td>
    <td  width="4%" >����</td>
    <td  width="3%" >�����־</td>
    <td  width="3%" >����</td>
    <td  width="6%" >��Ŀ���</td>
    <td  width="14%" >��Ŀ����</td>
    <td  width="4%" >��λ</td>
    <td  width="5%" >����</td>
    <td  width="5%" >���ⵥ��</td>
    <td  width="6%" >������</td>
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
	int i=0;

	double dj=0;
	double sl=0;
	double dwbjje=0;

	//���ǣ�Ϊ�˰Ѷ�����Ŀɾ��
	ls_sql="update cw_deyjsmx set mark='0'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	double cbdj=0;
	double cbje=0;
	double mll=0;
	double mle=0;
	double nbjsdj=0;
	double nbjsje=0;
	double gsmll=0;
	double gsmlr=0;
	String xclbz="";

	//�����Ŀ��ϸ
	ls_sql="SELECT bj_bjxmmx.xmpx,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.bjlx,bj_bjxmmx.xmmc,bj_bjxmmx.jldwbm,jldwmc,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx  ";
	ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.sl*bj_bjxmmx.dj>0";
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
		dwbjje=rs.getDouble("je");


		//��ʼ��
		cbdj=0;
		cbje=0;
		mll=0;
		mle=0;
		nbjsdj=0;
		nbjsje=0;
		gsmll=0;
		gsmlr=0;

		//�жϹ������Ƿ�Ϊ0���޹�������Ŀ���
		if (sl<=0)
		{
			continue;
		}

		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
		{
			xclbz="";//N��δ����Y���Ѵ���
			xsclfbfb="";
		}
		else{
			xsclfbfb=clfbfb+"";
			xclbz="N";//N��δ����Y���Ѵ���
		}

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


		cbdj=cf.doubleTrim(cbdj,2);

		cbje=sl*cbdj;//������*�ɱ�����
		cbje=cf.doubleTrim(cbje);

		mll=(dwbjje-cbje)/dwbjje*100;//�����ⱨ�۽��ɱ���/���۽��
		mll=cf.doubleTrim(mll);

		mle=dwbjje-cbje;//ë����*���ⱨ�۽��
		mle=cf.doubleTrim(mle);


		//������и���Ŀ��ȡ�����������ϵ���������־
		ls_sql="SELECT jsblxs,xclbz";
		ls_sql+=" FROM cw_deyjsmx  ";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jsblxs=rs1.getDouble(1);
			xclbz=cf.fillNull(rs1.getString(2));

			rs1.close();
			ps1.close();

			//ɾ��
			ls_sql="delete from cw_deyjsmx ";
			ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		rs1.close();
		ps1.close();

		nbjsdj=cbdj*(1+jsblxs/100);//�ɱ�����*(1+�������ϵ��)
		nbjsdj=cf.doubleTrim(nbjsdj);

		nbjsje=nbjsdj*sl;//�ڲ����㵥��*��������
		nbjsje=cf.doubleTrim(nbjsje);

		gsmll=(dwbjje-nbjsje)/dwbjje*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
		gsmll=cf.doubleTrim(gsmll);

		gsmlr=dwbjje-nbjsje;//��˾ë����*���ⱨ�۽��
		gsmlr=cf.doubleTrim(gsmlr);


		//��������������ϸ��cw_deyjsmx��
		ls_sql="insert into cw_deyjsmx (khbh,xh,xmbh,xmmc,jldwbm,sl,dwbjdj,dwbjje,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,clfbfb,bjlx,xclbz,mark)";
		ls_sql+=" values('"+khbh+"',"+row+",'"+xmbh+"','"+xmmc+"','"+jldwbm+"',"+sl+","+dj+","+dwbjje+","+cbdj+","+cbje+","+mll+","+mle+","+jsblxs+","+nbjsdj+","+nbjsje+","+gsmll+","+gsmlr+","+clfbfb+",'"+bjlx+"','"+xclbz+"','1') ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		row++;
	}
	rs.close();
	ps.close();

	//��ʾ����
	row=1;
	ls_sql="SELECT bjlx,xmbh,xmmc,cw_deyjsmx.jldwbm,jldwmc,sl,dwbjdj,dwbjje,clfbfb,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,DECODE(xclbz,'N','δ����','Y','����') xclbz";
	ls_sql+=" FROM cw_deyjsmx,jdm_jldwbm";
	ls_sql+=" where cw_deyjsmx.jldwbm=jdm_jldwbm.jldwbm and khbh='"+khbh+"'";
	ls_sql+=" order by xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjlx=rs.getString("bjlx");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		jldwbm=rs.getString("jldwbm");
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		sl=rs.getDouble("sl");//������
		dj=rs.getDouble("dwbjdj");//���ⵥ��
		dwbjje=rs.getDouble("dwbjje");//������
		clfbfb=rs.getDouble("clfbfb");
		cbdj=rs.getDouble("cbdj");
		cbje=rs.getDouble("cbje");
		mll=rs.getDouble("mll");
		mle=rs.getDouble("mle");
		jsblxs=rs.getDouble("jsblxs");
		nbjsdj=rs.getDouble("nbjsdj");
		nbjsje=rs.getDouble("nbjsje");
		gsmll=rs.getDouble("gsmll");
		gsmlr=rs.getDouble("gsmlr");
		xclbz=rs.getString("xclbz");

		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
		{
			bjlxmc="��׼";
		}
		else{
			bjlxmc="�Զ���";
		}
		
		xjdwbjje+=dwbjje;
		xjcbje+=cbje;
		xjmle+=mle;
		xjnbjsje+=nbjsje;
		xjgsmlr+=gsmlr;

		String clstr="";
		if (xclbz==null)
		{
			xclbz="&nbsp;";
			clstr="&nbsp;";
		}
		else{
			clstr="<A HREF='InsertYjsBj_jzglfxb.jsp?khbh="+khbh+"&xmbh="+xmbh+"' target='_blank'>�޸�</A>";
		}
		
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=bjlxmc%></td>
			<td ><%=xclbz%></td>
			<td ><%=clstr%></td>
			<td ><%=xmbh%></td>
			<td ><%=xmmc%></td>
			<td ><%=jldwmc%></td>
			<td ><%=sl%></td>
			<td ><%=dj%></td>
			<td ><%=dwbjje%></td>
			<td><%=cbdj%></td>
			<td><%=cbje%></td>
			<td><%=mll%>%</td>
			<td><%=mle%></td>
			<td><%=jsblxs%>%</td>
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

	if (xjdwbjje==0)
	{
		xjdwbjje=cf.doubleTrim(xjdwbjje);
		xjcbje=cf.doubleTrim(xjcbje);
		xjmle=cf.doubleTrim(xjmle);
		xjnbjsje=cf.doubleTrim(xjnbjsje);
		xjgsmlr=cf.doubleTrim(xjgsmlr);

		xjmll=0;//�����ⱨ�۽��ɱ���/���۽��
		xjgsmll=0;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
	}
	else{
		xjdwbjje=cf.doubleTrim(xjdwbjje);
		xjcbje=cf.doubleTrim(xjcbje);
		xjmle=cf.doubleTrim(xjmle);
		xjnbjsje=cf.doubleTrim(xjnbjsje);
		xjgsmlr=cf.doubleTrim(xjgsmlr);

		xjmll=(xjdwbjje-xjcbje)/xjdwbjje*100;//�����ⱨ�۽��ɱ���/���۽��
		xjmll=cf.doubleTrim(xjmll);
		xjgsmll=(xjdwbjje-xjnbjsje)/xjdwbjje*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
		xjgsmll=cf.doubleTrim(xjgsmll);
	}
%>	
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="4">�ϼ�</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=xjdwbjje%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=xjcbje%></td>
	<td><%=xjmll%>%</td>
	<td><%=xjmle%></td>
	<td >&nbsp;</td>
	<td><%=xjnbjsje%></td>
	<td><%=xjgsmll%>%</td>
	<td><%=xjgsmlr%></td>
    </tr>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="19" > 
		  <input type=button value='ȷ�������������ϵ��' onClick="cf_submit(listform)" >
      </td>
    </tr>
</table>
</form>
</body>
</html>

<%
	//ɾ��������Ŀ
	ls_sql="delete from cw_dejsmx";
	ls_sql+=" where khbh='"+khbh+"' and mark='0'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
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
function cf_submit(FormName)
{
	FormName.action="Cw_deyjsmxList.jsp";
	FormName.submit();
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

