<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

String yhmc=(String)session.getAttribute("yhmc");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String yx_lqlpdj_khbh=null;
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_fwdz=null;
	String crm_zxkhxx_lxfs=null;
	String crm_zxkhxx_sjs=null;
	String yx_lqlpdj_lpmc=null;
	String yx_lqlpdj_lpsl=null;
	String yx_lqlpdj_lqsj=null;
	String yx_lqlpdj_shth=null;
	String yx_lqlpdj_lrr=null;
	String yx_lqlpdj_lrsj=null;
	String yx_lqlpdj_thdjr=null;
	String yx_lqlpdj_thdjsj=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";
	String crm_zxkhxx_zxdm=null;
	crm_zxkhxx_zxdm=request.getParameter("crm_zxkhxx_zxdm");
	if (crm_zxkhxx_zxdm!=null)
	{
		crm_zxkhxx_zxdm=cf.GB2Uni(crm_zxkhxx_zxdm);
		if (!(crm_zxkhxx_zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+crm_zxkhxx_zxdm+"')";
	}
	
	yx_lqlpdj_khbh=request.getParameter("yx_lqlpdj_khbh");
	if (yx_lqlpdj_khbh!=null)
	{
		yx_lqlpdj_khbh=cf.GB2Uni(yx_lqlpdj_khbh);
		if (!(yx_lqlpdj_khbh.equals("")))	wheresql+=" and  (yx_lqlpdj.khbh='"+yx_lqlpdj_khbh+"')";
	}
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+crm_zxkhxx_khxm+"%')";
	}
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+crm_zxkhxx_fwdz+"%')";
	}
	crm_zxkhxx_lxfs=request.getParameter("crm_zxkhxx_lxfs");
	if (crm_zxkhxx_lxfs!=null)
	{
		crm_zxkhxx_lxfs=cf.GB2Uni(crm_zxkhxx_lxfs);
		if (!(crm_zxkhxx_lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+crm_zxkhxx_lxfs+"%')";
	}
	crm_zxkhxx_sjs=request.getParameter("crm_zxkhxx_sjs");
	if (crm_zxkhxx_sjs!=null)
	{
		crm_zxkhxx_sjs=cf.GB2Uni(crm_zxkhxx_sjs);
		if (!(crm_zxkhxx_sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+crm_zxkhxx_sjs+"')";
	}
	yx_lqlpdj_lpmc=request.getParameter("yx_lqlpdj_lpmc");
	if (yx_lqlpdj_lpmc!=null)
	{
		yx_lqlpdj_lpmc=cf.GB2Uni(yx_lqlpdj_lpmc);
		if (!(yx_lqlpdj_lpmc.equals("")))	wheresql+=" and  (yx_lqlpdj.lpmc like '%"+yx_lqlpdj_lpmc+"%')";
	}
	yx_lqlpdj_lpsl=request.getParameter("yx_lqlpdj_lpsl");
	if (yx_lqlpdj_lpsl!=null)
	{
		yx_lqlpdj_lpsl=yx_lqlpdj_lpsl.trim();
		if (!(yx_lqlpdj_lpsl.equals("")))	wheresql+=" and (yx_lqlpdj.lpsl="+yx_lqlpdj_lpsl+") ";
	}
	yx_lqlpdj_lqsj=request.getParameter("yx_lqlpdj_lqsj");
	if (yx_lqlpdj_lqsj!=null)
	{
		yx_lqlpdj_lqsj=yx_lqlpdj_lqsj.trim();
		if (!(yx_lqlpdj_lqsj.equals("")))	wheresql+="  and (yx_lqlpdj.lqsj>=TO_DATE('"+yx_lqlpdj_lqsj+"','YYYY/MM/DD'))";
	}
	yx_lqlpdj_lqsj=request.getParameter("yx_lqlpdj_lqsj2");
	if (yx_lqlpdj_lqsj!=null)
	{
		yx_lqlpdj_lqsj=yx_lqlpdj_lqsj.trim();
		if (!(yx_lqlpdj_lqsj.equals("")))	wheresql+="  and (yx_lqlpdj.lqsj<=TO_DATE('"+yx_lqlpdj_lqsj+"','YYYY/MM/DD'))";
	}
	yx_lqlpdj_shth=request.getParameter("yx_lqlpdj_shth");
	if (yx_lqlpdj_shth!=null)
	{
		yx_lqlpdj_shth=cf.GB2Uni(yx_lqlpdj_shth);
		if (!(yx_lqlpdj_shth.equals("")))	wheresql+=" and  (yx_lqlpdj.shth='"+yx_lqlpdj_shth+"')";
	}
	yx_lqlpdj_lrr=request.getParameter("yx_lqlpdj_lrr");
	if (yx_lqlpdj_lrr!=null)
	{
		yx_lqlpdj_lrr=cf.GB2Uni(yx_lqlpdj_lrr);
		if (!(yx_lqlpdj_lrr.equals("")))	wheresql+=" and  (yx_lqlpdj.lrr='"+yx_lqlpdj_lrr+"')";
	}
	yx_lqlpdj_lrsj=request.getParameter("yx_lqlpdj_lrsj");
	if (yx_lqlpdj_lrsj!=null)
	{
		yx_lqlpdj_lrsj=yx_lqlpdj_lrsj.trim();
		if (!(yx_lqlpdj_lrsj.equals("")))	wheresql+="  and (yx_lqlpdj.lrsj>=TO_DATE('"+yx_lqlpdj_lrsj+"','YYYY/MM/DD'))";
	}
	yx_lqlpdj_lrsj=request.getParameter("yx_lqlpdj_lrsj2");
	if (yx_lqlpdj_lrsj!=null)
	{
		yx_lqlpdj_lrsj=yx_lqlpdj_lrsj.trim();
		if (!(yx_lqlpdj_lrsj.equals("")))	wheresql+="  and (yx_lqlpdj.lrsj<=TO_DATE('"+yx_lqlpdj_lrsj+"','YYYY/MM/DD'))";
	}
	yx_lqlpdj_thdjr=request.getParameter("yx_lqlpdj_thdjr");
	if (yx_lqlpdj_thdjr!=null)
	{
		yx_lqlpdj_thdjr=cf.GB2Uni(yx_lqlpdj_thdjr);
		if (!(yx_lqlpdj_thdjr.equals("")))	wheresql+=" and  (yx_lqlpdj.thdjr='"+yx_lqlpdj_thdjr+"')";
	}
	yx_lqlpdj_thdjsj=request.getParameter("yx_lqlpdj_thdjsj");
	if (yx_lqlpdj_thdjsj!=null)
	{
		yx_lqlpdj_thdjsj=yx_lqlpdj_thdjsj.trim();
		if (!(yx_lqlpdj_thdjsj.equals("")))	wheresql+="  and (yx_lqlpdj.thdjsj>=TO_DATE('"+yx_lqlpdj_thdjsj+"','YYYY/MM/DD'))";
	}
	yx_lqlpdj_thdjsj=request.getParameter("yx_lqlpdj_thdjsj2");
	if (yx_lqlpdj_thdjsj!=null)
	{
		yx_lqlpdj_thdjsj=yx_lqlpdj_thdjsj.trim();
		if (!(yx_lqlpdj_thdjsj.equals("")))	wheresql+="  and (yx_lqlpdj.thdjsj<=TO_DATE('"+yx_lqlpdj_thdjsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_zxkhxx.khxm,crm_zxkhxx.fwdz,yx_lqlpdj.lpmc,yx_lqlpdj.lpsl,yx_lqlpdj.lqsj,DECODE(yx_lqlpdj.shth,'1','��ȡ','2','�˻�'),yx_lqlpdj.thdjr,yx_lqlpdj.thdjsj,crm_zxkhxx.sjs,b.dwmc zxdm,yx_lqlpdj.lrr,yx_lqlpdj.lrsj,a.dwmc lrbm,yx_lqlpdj.bz,yx_lqlpdj.khbh";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b,yx_lqlpdj  ";
    ls_sql+=" where yx_lqlpdj.khbh=crm_zxkhxx.khbh and yx_lqlpdj.lrbm=a.dwbh and crm_zxkhxx.zxdm=b.dwbh(+)";
    ls_sql+=wheresql;
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=" order by yx_lqlpdj.lqsj,yx_lqlpdj.khbh";
	
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yx_lqlpdjXgTlpList.jsp","SelectXgTlpYx_lqlpdj.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_sjs","crm_zxkhxx_zxdm","lpmc","yx_lqlpdj_lpsl","yx_lqlpdj_lqsj","yx_lqlpdj_shth","yx_lqlpdj_lrr","yx_lqlpdj_lrsj","sq_dwxx_dwmc","yx_lqlpdj_bz","yx_lqlpdj_thdjr","yx_lqlpdj_thdjsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh","lpmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ������Ʒ"};//��ť����ʾ����
	String[] buttonLink={"Yx_lqlpdjXgTlpList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem =request.getParameter("chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update yx_lqlpdj set shth='1',thdjr=null,thdjsj=null where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����Ʒ���޸�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="12%">��Ʒ����</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="5%">��ȡʱ��</td>
	<td  width="3%">�Ƿ��˻�</td>
	<td  width="3%">�˻صǼ���</td>
	<td  width="5%">�˻صǼ�ʱ��</td>
	<td  width="4%">���ʦ</td>
	<td  width="7%">��ѯ����</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
	<td  width="19%">��ע</td>
	<td  width="4%">�ͻ����</td>
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