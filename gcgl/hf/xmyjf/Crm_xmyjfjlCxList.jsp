<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	String gj=null;
	gj=request.getParameter("gj");
	if (gj!=null)
	{
		gj=cf.GB2Uni(gj);
		if (!(gj.equals("")))	wheresql+=" and  (crm_khxx.gj='"+gj+"')";
	}
	String dd=null;
	dd=request.getParameter("dd");
	if (dd!=null)
	{
		dd=cf.GB2Uni(dd);
		if (!(dd.equals("")))	wheresql+=" and  (crm_khxx.dd='"+dd+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	
	
	
	String crm_xmyjfjl_yjfjlh=null;
	String crm_xmyjfjl_yjfr=null;
	String crm_xmyjfjl_yjfsj=null;
	String crm_xmyjfjl_lrr=null;
	String crm_xmyjfjl_lrsj=null;

	crm_xmyjfjl_yjfjlh=request.getParameter("crm_xmyjfjl_yjfjlh");
	if (crm_xmyjfjl_yjfjlh!=null)
	{
		crm_xmyjfjl_yjfjlh=cf.GB2Uni(crm_xmyjfjl_yjfjlh);
		if (!(crm_xmyjfjl_yjfjlh.equals("")))	wheresql+=" and  (crm_xmyjfjl.yjfjlh='"+crm_xmyjfjl_yjfjlh+"')";
	}
	crm_xmyjfjl_yjfr=request.getParameter("crm_xmyjfjl_yjfr");
	if (crm_xmyjfjl_yjfr!=null)
	{
		crm_xmyjfjl_yjfr=cf.GB2Uni(crm_xmyjfjl_yjfr);
		if (!(crm_xmyjfjl_yjfr.equals("")))	wheresql+=" and  (crm_xmyjfjl.yjfr='"+crm_xmyjfjl_yjfr+"')";
	}
	crm_xmyjfjl_yjfsj=request.getParameter("crm_xmyjfjl_yjfsj");
	if (crm_xmyjfjl_yjfsj!=null)
	{
		crm_xmyjfjl_yjfsj=crm_xmyjfjl_yjfsj.trim();
		if (!(crm_xmyjfjl_yjfsj.equals("")))	wheresql+="  and (crm_xmyjfjl.yjfsj>=TO_DATE('"+crm_xmyjfjl_yjfsj+"','YYYY/MM/DD'))";
	}
	crm_xmyjfjl_yjfsj=request.getParameter("crm_xmyjfjl_yjfsj2");
	if (crm_xmyjfjl_yjfsj!=null)
	{
		crm_xmyjfjl_yjfsj=crm_xmyjfjl_yjfsj.trim();
		if (!(crm_xmyjfjl_yjfsj.equals("")))	wheresql+="  and (crm_xmyjfjl.yjfsj<=TO_DATE('"+crm_xmyjfjl_yjfsj+"','YYYY/MM/DD'))";
	}


	crm_xmyjfjl_lrr=request.getParameter("crm_xmyjfjl_lrr");
	if (crm_xmyjfjl_lrr!=null)
	{
		crm_xmyjfjl_lrr=cf.GB2Uni(crm_xmyjfjl_lrr);
		if (!(crm_xmyjfjl_lrr.equals("")))	wheresql+=" and  (crm_xmyjfjl.lrr='"+crm_xmyjfjl_lrr+"')";
	}
	crm_xmyjfjl_lrsj=request.getParameter("crm_xmyjfjl_lrsj");
	if (crm_xmyjfjl_lrsj!=null)
	{
		crm_xmyjfjl_lrsj=crm_xmyjfjl_lrsj.trim();
		if (!(crm_xmyjfjl_lrsj.equals("")))	wheresql+="  and (crm_xmyjfjl.lrsj>=TO_DATE('"+crm_xmyjfjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xmyjfjl_lrsj=request.getParameter("crm_xmyjfjl_lrsj2");
	if (crm_xmyjfjl_lrsj!=null)
	{
		crm_xmyjfjl_lrsj=crm_xmyjfjl_lrsj.trim();
		if (!(crm_xmyjfjl_lrsj.equals("")))	wheresql+="  and (crm_xmyjfjl.lrsj<=TO_DATE('"+crm_xmyjfjl_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_xmyjfjl.yjfjlh,DECODE(crm_khxx.xmjfzt,'N','δ����','S','Ԥ����','Y','�طóɹ�','X','�ط�ʧ��','C','ʧ���Ѵ���','W','��Ŀ����'),crm_xmyjfjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_khxx.gj,crm_khxx.dd,crm_xmyjfjl.yjfr,crm_xmyjfjl.yjfsj,crm_xmyjfjl.yjfsm, crm_xmyjfjl.lrr,crm_xmyjfjl.lrsj,dwmc ";
	ls_sql+=" FROM crm_khxx,crm_xmyjfjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where crm_xmyjfjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_xmyjfjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_khxx.xmjfzt in('S') ";//N��δ������S��Ԥ������Y���طóɹ���X���ط�ʧ�ܣ�C��ʧ���Ѵ���W����Ŀ����
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_xmyjfjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"yjfjlh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ĿԤ��������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">������¼��</td>
	<td  width="4%">����״̬</td>
	<td  width="4%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">�ܼ�</td>
	<td  width="4%">����</td>
	<td  width="4%">Ԥ������</td>
	<td  width="5%">Ԥ����ʱ��</td>
	<td  width="23%">Ԥ����˵��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
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