<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String yhdlm=(String)session.getAttribute("yhdlm");
	String jjsjsmc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='12'");
	if (jjsjsmc==null)
	{
		jjsjsmc="";
	}
	String jcddglbz=(String)session.getAttribute("jcddglbz");
	if (jcddglbz.equals("N"))//���˱�־
	{
		jjsjsmc="";
	}

	String ls_sql=null;
	String wheresql="";

	String ddbh=null;
	String khbh=null;
	String dwbh=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	String cgsjs=null;
	String clzt=null;
	String khlx=null;
	String fgs=null;
	
	String pdgc=null;
	pdgc=request.getParameter("pdgc");
	if (pdgc!=null)
	{
		pdgc=cf.GB2Uni(pdgc);
		if (!(pdgc.equals("")))	wheresql+=" and  (jc_cgdd.pdgc='"+pdgc+"')";
	}
	String sfpsjs=null;
	sfpsjs=request.getParameter("sfpsjs");
	if (sfpsjs!=null)
	{
		sfpsjs=cf.GB2Uni(sfpsjs);
		if (!(sfpsjs.equals("")))	wheresql+=" and  (jc_cgdd.sfpsjs='"+sfpsjs+"')";
	}


	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (jc_cgdd.dwbh='"+dwbh+"')";
	}
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql+=" and  (jc_cgdd.ddbh='"+ddbh+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (jc_cgdd.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_cgdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_cgdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_cgdd.xmzy='"+xmzy+"')";
	}
	cgsjs=request.getParameter("cgsjs");
	if (cgsjs!=null)
	{
		cgsjs=cf.GB2Uni(cgsjs);
		if (!(cgsjs.equals("")))	wheresql+=" and  (jc_cgdd.cgsjs='"+cgsjs+"')";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (jc_cgdd.clzt='"+clzt+"')";
	}
	khlx=request.getParameter("khlx");
	if (khlx!=null)
	{
		khlx=cf.GB2Uni(khlx);
		if (!(khlx.equals("")))	wheresql+=" and  (jc_cgdd.khlx='"+khlx+"')";
	}


	ls_sql="SELECT jc_cgdd.ddbh as ddbh,gysmc,DECODE(jc_cgdd.sfpsjs,'1','��','2','��') sfpsjs,jc_cgdd.khbh as khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.cgsjs as jc_cgdd_cgsjs,clztmc,DECODE(jc_cgdd.khlx,'2','��װ�ͻ�','4','�Ǽ�װ') as jc_cgdd_khlx,jc_cgdd.pdsj,jc_cgdd.sfcsj,jc_cgdd.jhfcsj,a.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_dwxx a,sq_gysxx";
    ls_sql+=" where jc_cgdd.dwbh=a.dwbh and jc_cgdd.pdgc=sq_gysxx.gysbh(+) ";
    ls_sql+=" and jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
    ls_sql+=" and ((jc_cgdd.clzt='01' and jc_cgdd.sfpsjs='2') or (jc_cgdd.clzt='11' and jc_cgdd.sfpsjs='1'))";
	if (!jjsjsmc.equals(""))
	{
		ls_sql+=" and (jc_cgdd.cgsjs='"+jjsjsmc+"')";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jc_cgdd.sfcsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","HtJc_cgdd.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("��ͬ");//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"ddbh","clztmc","gysmc","sfpsjs","jc_cgdd_cgsjs","pdsj","jhfcsj","sfcsj","khxm","fwdz","hth","jc_cgdd_khlx","clgw","ztjjgw","xmzy","jc_cgdd_dj","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jc_cgdd_khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ǩ����ͬ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">�������</td>
	<td  width="6%">����״̬</td>
	<td  width="6%">�ɵ�����</td>
	<td  width="3%">�Ƿ������ʦ </td>
	<td  width="4%">�Ҿ����ʦ</td>
	<td  width="6%">�ɵ�ʱ��</td>
	<td  width="6%">�ƻ�����ʱ��</td>
	<td  width="6%">ʵ����ʱ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="18%">���ݵ�ַ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="4%">פ��Ҿӹ���</td>
	<td  width="4%">չ���Ҿӹ���</td>
	<td  width="4%">��ĿרԱ</td>
	<td  width="4%">���񶩽�</td>
	<td  width="7%">¼�벿��</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>