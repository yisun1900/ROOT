<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String zwbm=(String)session.getAttribute("zwbm");
String yhdlm=(String)session.getAttribute("yhdlm");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_zdyxmb_dqbm=null;
	String bj_zdyxmb_xmbh=null;
	String bj_zdyxmb_xmmc=null;
	String[] bj_zdyxmb_xmdlbm=null;
	String[] bj_zdyxmb_xmxlbm=null;
	String bj_zdyxmb_smbm=null;
	String bj_zdyxmb_jldwbm=null;

	String xmflbm=null;
	xmflbm=request.getParameter("xmflbm");
	if (xmflbm!=null)
	{
		xmflbm=cf.GB2Uni(xmflbm);
		if (!(xmflbm.equals("")))	wheresql+=" and  (bj_zdyxmb.xmflbm='"+xmflbm+"')";
	}

	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_zdyxmb.bjjbbm='"+bjjbbm+"')";
	}


	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		if (!(shbz.equals("")))	wheresql+=" and  (bj_zdyxmb.shbz='"+shbz+"')";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+lrr+"%')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (bj_zdyxmb.lrsj=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}

	String gycl=null;
	gycl=request.getParameter("gycl");
	if (gycl!=null)
	{
		gycl=cf.GB2Uni(gycl);
		if (!(gycl.equals("")))	wheresql+=" and  (bj_zdyxmb.gycl like '%"+gycl+"%')";
	}
	
	bj_zdyxmb_dqbm=request.getParameter("bj_zdyxmb_dqbm");
	if (!(bj_zdyxmb_dqbm.equals("")))	wheresql+=" and  (bj_zdyxmb.dqbm='"+bj_zdyxmb_dqbm+"')";

	bj_zdyxmb_xmbh=request.getParameter("bj_zdyxmb_xmbh");
	if (bj_zdyxmb_xmbh!=null)
	{
		bj_zdyxmb_xmbh=cf.GB2Uni(bj_zdyxmb_xmbh);
		if (!(bj_zdyxmb_xmbh.equals("")))	wheresql+=" and  (bj_zdyxmb.xmbh='"+bj_zdyxmb_xmbh+"')";
	}
	bj_zdyxmb_xmmc=request.getParameter("bj_zdyxmb_xmmc");
	if (bj_zdyxmb_xmmc!=null)
	{
		bj_zdyxmb_xmmc=cf.GB2Uni(bj_zdyxmb_xmmc);
		if (!(bj_zdyxmb_xmmc.equals("")))	wheresql+=" and  (bj_zdyxmb.xmmc like '%"+bj_zdyxmb_xmmc+"%')";
	}
	bj_zdyxmb_xmdlbm=request.getParameterValues("bj_zdyxmb_xmdlbm");
	if (bj_zdyxmb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_zdyxmb_xmdlbm,"bj_zdyxmb.xmdlbm");
	}
	bj_zdyxmb_xmxlbm=request.getParameterValues("bj_zdyxmb_xmxlbm");
	if (bj_zdyxmb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_zdyxmb_xmxlbm,"bj_zdyxmb.xmxlbm");
	}
	bj_zdyxmb_smbm=request.getParameter("bj_zdyxmb_smbm");
	if (bj_zdyxmb_smbm!=null)
	{
		bj_zdyxmb_smbm=cf.GB2Uni(bj_zdyxmb_smbm);
		if (!(bj_zdyxmb_smbm.equals("")))	wheresql+=" and  (bj_zdyxmb.smbm='"+bj_zdyxmb_smbm+"')";
	}
	bj_zdyxmb_jldwbm=request.getParameter("bj_zdyxmb_jldwbm");
	if (bj_zdyxmb_jldwbm!=null)
	{
		bj_zdyxmb_jldwbm=cf.GB2Uni(bj_zdyxmb_jldwbm);
		if (!(bj_zdyxmb_jldwbm.equals("")))	wheresql+=" and  (bj_zdyxmb.jldwbm='"+bj_zdyxmb_jldwbm+"')";
	}

	ls_sql="SELECT DECODE(bj_zdyxmb.shbz,'N','����','S','����','Y',' ���ͨ��','W','δͨ��','C','��������') shbz,dwmc,DECODE(bj_zdyshjl.sfbxg,'Y','��','N','��') sfbxg,bj_zdyxmb.xmbh,bj_zdyxmb.xmmc,bjjbmc,bj_zdyxmb.zdyxmyxq,jdm_jldwbm.jldwmc,bj_zdyxmb.bj,yhmc,bj_zdyxmb.lrr,bj_zdyxmb.lrsj,dqmc,bj_zdyxmb.gycl,bj_zdyxmb.flmcgg,bj_zdyxmb.bz,xmdlmc,xmxlmc,xmflmc,smmc,bj_zdyxmb.ckxm,bj_zdyxmb.sqjl,bj_zdyshjl.slr,bj_zdyshjl.slsj,bj_zdyshjl.slsm,bj_zdyshjl.shr,bj_zdyshjl.shsj,bj_zdyshjl.shyj,DECODE(bj_zdyxmb.sfxycl,'Y','��Ҫ','N','��') sfxycl,DECODE(bj_zdyxmb.sfxyyjd,'Y','��Ҫ','N','��') sfxyyjd";
	ls_sql+=" FROM bj_zdyxmb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm,bj_zdyshjl,bdm_xmflbm,sq_yhxx,sq_dwxx   ";
	ls_sql+=" where bj_zdyxmb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_zdyxmb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_zdyxmb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zdyxmb.smbm=bdm_smbm.smbm(+) and bj_zdyxmb.dqbm=dm_dqbm.dqbm(+) and bj_zdyxmb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_zdyxmb.xmflbm=bdm_xmflbm.xmflbm(+)"; 	
	ls_sql+=" and bj_zdyxmb.bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"')";
	ls_sql+=" and bj_zdyxmb.sqjl=bj_zdyshjl.sqjl(+) ";
	ls_sql+=" and bj_zdyxmb.lrr=sq_yhxx.yhdlm(+)"; 	
	ls_sql+=" and sq_yhxx.dwbh=sq_dwxx.dwbh(+)"; 	
	ls_sql+=wheresql;
	ls_sql+=" order by bj_zdyxmb.dqbm,sq_yhxx.yhmc,bj_zdyxmb.xmbh";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("Bj_zdyxmbCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"xmbh","xmmc","shbz","sfbxg","yhmc","dwmc","bjjbmc","zdyxmyxq","jldwmc","bj","lrsj","dqmc","gycl","flmcgg","bz","xmdlmc","xmxlmc","xmflmc","smmc","ckxm","sqjl","slr","slsj","slsm","shr","shsj","shyj","sfxycl","sfxyyjd"};
	pageObj.setDisColName(disColName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"lrr","xmbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewBj_zdyshjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xmbh",coluParm);//�в����������Hash��
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
  <B><font size="3">�Զ�����Ŀ��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(470);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">��Ŀ���</td>
	<td  width="6%">��Ŀ����</td>
	<td  width="2%">��˱�־</td>
	<td  width="1%">�Ƿ��޸�</td>
	<td  width="2%">¼����</td>
	<td  width="3%">����</td>
	<td  width="2%">���ۼ���</td>
	<td  width="2%">�Զ�����Ŀ��Ч��</td>
	<td  width="1%">������λ</td>
	<td  width="2%">����Ԥ���</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="2%">����</td>
	<td  width="16%">���ղ��ϼ��</td>
	<td  width="9%">�������ƹ��</td>
	<td  width="8%">��ע</td>
	<td  width="3%">��Ŀ����</td>
	<td  width="4%">��ĿС��</td>
	<td  width="3%">��Ŀ����</td>
	<td  width="2%">����</td>
	<td  width="3%">�ο���Ŀ</td>
	<td  width="2%">�����¼</td>
	<td  width="2%">������</td>
	<td  width="2%">����ʱ��</td>
	<td  width="6%">����˵��</td>
	<td  width="2%">�����</td>
	<td  width="2%">���ʱ��</td>
	<td  width="5%">������</td>
	<td  width="1%">��Ҫ����</td>
	<td  width="1%">��Ԥ����</td>
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