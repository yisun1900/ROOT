<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
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

	ls_sql="SELECT bj_zdyxmb.dqbm,dqmc,dwmc,xmdlmc,xmxlmc,xmflmc,bj_zdyxmb.zdyxmyxq,bj_zdyxmb.xmbh,bj_zdyxmb.bjjbbm,bjjbmc,bj_zdyxmb.xmmc,smmc,jdm_jldwbm.jldwmc,bj_zdyxmb.sgcbj,bj_zdyxmb.sgdbj,bj_zdyxmb.bj,bj_zdyxmb.clbj,bj_zdyxmb.zcf,bj_zdyxmb.rgbj,bj_zdyxmb.ysf,bj_zdyxmb.jxbj,bj_zdyxmb.shf,bj_zdyxmb.qtf,bj_zdyxmb.clcb,bj_zdyxmb.rgcb,bj_zdyxmb.jxcb,bj_zdyxmb.cbenj,yhmc,bj_zdyxmb.lrr,bj_zdyxmb.lrsj,DECODE(bj_zdyxmb.shbz,'N','�������','S','��������','Y',' ���ͨ��','W','���δͨ��','C','��������') shbz,gycl,flmcgg,bj_zdyxmb.bz,DECODE(bj_zdyxmb.sfxycl,'Y','��Ҫ','N','��') sfxycl,DECODE(bj_zdyxmb.sfxyyjd,'Y','��Ҫ','N','��') sfxyyjd";
	ls_sql+=" FROM bj_zdyxmb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm,bdm_xmflbm,sq_yhxx,sq_dwxx   ";
	ls_sql+=" where bj_zdyxmb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_zdyxmb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_zdyxmb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zdyxmb.smbm=bdm_smbm.smbm(+) and bj_zdyxmb.dqbm=dm_dqbm.dqbm(+) and bj_zdyxmb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_zdyxmb.xmflbm=bdm_xmflbm.xmflbm(+)"; 	
	ls_sql+=" and bj_zdyxmb.shbz in('N','S','C')";//N; ������ˣ�S:�������룻Y:���ͨ����W:���δͨ����C:��������
	ls_sql+=" and bj_zdyxmb.lrr=sq_yhxx.yhdlm(+)"; 	
	ls_sql+=" and sq_yhxx.dwbh=sq_dwxx.dwbh(+)"; 	
	ls_sql+=wheresql;
	ls_sql+=" order by bj_zdyxmb.dqbm,sq_yhxx.yhmc,bj_zdyxmb.xmbh";

    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("Bj_zdyxmbShList.jsp","","","ShBj_zdyxmb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"xmbh","xmmc","shbz","dqmc","bjjbmc","yhmc","dwmc","jldwmc","bj","sgcbj","cbenj","zdyxmyxq","gycl","flmcgg","bz","xmdlmc","xmxlmc","xmflmc","smmc","lrsj","sfxycl","sfxyyjd"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"lrr","xmbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");

//���ð�ť����
	String[] buttonName={"��������","����ͬ��","ɾ������"};//��ť����ʾ����
	String[] buttonLink={"plslzdyxm.jsp","plshzdyxm.jsp","deletezdysl.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,1,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
  <B><font size="3">�Զ�����Ŀ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">��Ŀ���</td>
	<td  width="7%">��Ŀ����</td>
	<td  width="2%">��˱�־</td>
	<td  width="2%">����</td>
	<td  width="2%">���ۼ���</td>
	<td  width="2%">¼����</td>
	<td  width="4%">����</td>
	<td  width="2%">������λ</td>
	<td  width="2%">����Ԥ���</td>
	<td  width="2%">ʩ���ɱ���</td>
	<td  width="2%">�ɱ���</td>

	<td  width="3%">�Զ�����Ŀ��Ч��</td>
	<td  width="12%">���ղ��ϼ��</td>
	<td  width="7%">�������ƹ��</td>
	<td  width="7%">��ע</td>
	<td  width="3%">��Ŀ����</td>
	<td  width="3%">��ĿС��</td>
	<td  width="3%">��Ŀ����</td>
	<td  width="3%">����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="2%">�Ƿ���Ҫ����</td>
	<td  width="2%">�Ƿ���Ԥ����</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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