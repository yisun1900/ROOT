<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String khxxsql="";
	String zxkhxxsql="";
	String ybj_cgsq_sqbh=null;
	String ybj_cgsq_dwbh=null;
	String ybj_cgsq_sqr=null;
	String ybj_cgsq_sqsj=null;
	String ybj_cgsq_fgflbm=null;
	String ybj_cgsq_zxjwbm=null;
	String ybj_cgsq_hxbm=null;
	String ybj_cgsq_hxmjbm=null;
	String ybj_cgsq_ysbm=null;
	String ybj_cgsq_sfyqd=null;
	String ybj_cgsq_clzt=null;
	String ybj_cgsq_khxm=null;
	String ybj_cgsq_fwdz=null;
	String ybj_cgsq_cqbm=null;
	String ybj_cgsq_lxfs=null;
	String ybj_cgsq_sjs=null;
	String ybj_cgsq_bz=null;
	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (ybj_cgsq.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";

	ybj_cgsq_sqbh=request.getParameter("ybj_cgsq_sqbh");
	if (ybj_cgsq_sqbh!=null)
	{
		ybj_cgsq_sqbh=ybj_cgsq_sqbh.trim();
		if (!(ybj_cgsq_sqbh.equals("")))	wheresql+=" and (ybj_cgsq.sqbh="+ybj_cgsq_sqbh+") ";
	}
	ybj_cgsq_dwbh=request.getParameter("ybj_cgsq_dwbh");
	if (ybj_cgsq_dwbh!=null)
	{
		ybj_cgsq_dwbh=cf.GB2Uni(ybj_cgsq_dwbh);
		if (!(ybj_cgsq_dwbh.equals("")))	wheresql+=" and  (ybj_cgsq.dwbh='"+ybj_cgsq_dwbh+"')";
	}
	ybj_cgsq_sqr=request.getParameter("ybj_cgsq_sqr");
	if (ybj_cgsq_sqr!=null)
	{
		ybj_cgsq_sqr=cf.GB2Uni(ybj_cgsq_sqr);
		if (!(ybj_cgsq_sqr.equals("")))	wheresql+=" and  (ybj_cgsq.sqr='"+ybj_cgsq_sqr+"')";
	}
	ybj_cgsq_sqsj=request.getParameter("ybj_cgsq_sqsj");
	if (ybj_cgsq_sqsj!=null)
	{
		ybj_cgsq_sqsj=ybj_cgsq_sqsj.trim();
		if (!(ybj_cgsq_sqsj.equals("")))	wheresql+="  and (ybj_cgsq.sqsj>=TO_DATE('"+ybj_cgsq_sqsj+"','YYYY/MM/DD'))";
	}
	ybj_cgsq_sqsj=request.getParameter("ybj_cgsq_sqsj2");
	if (ybj_cgsq_sqsj!=null)
	{
		ybj_cgsq_sqsj=ybj_cgsq_sqsj.trim();
		if (!(ybj_cgsq_sqsj.equals("")))	wheresql+="  and (ybj_cgsq.sqsj<=TO_DATE('"+ybj_cgsq_sqsj+"','YYYY/MM/DD'))";
	}
	ybj_cgsq_fgflbm=request.getParameter("ybj_cgsq_fgflbm");
	if (ybj_cgsq_fgflbm!=null)
	{
		ybj_cgsq_fgflbm=cf.GB2Uni(ybj_cgsq_fgflbm);
		if (!(ybj_cgsq_fgflbm.equals("")))	wheresql+=" and  (ybj_cgsq.fgflbm='"+ybj_cgsq_fgflbm+"')";
	}
	ybj_cgsq_zxjwbm=request.getParameter("ybj_cgsq_zxjwbm");
	if (ybj_cgsq_zxjwbm!=null)
	{
		ybj_cgsq_zxjwbm=cf.GB2Uni(ybj_cgsq_zxjwbm);
		if (!(ybj_cgsq_zxjwbm.equals("")))	wheresql+=" and  (ybj_cgsq.zxjwbm='"+ybj_cgsq_zxjwbm+"')";
	}
	ybj_cgsq_hxbm=request.getParameter("ybj_cgsq_hxbm");
	if (ybj_cgsq_hxbm!=null)
	{
		ybj_cgsq_hxbm=cf.GB2Uni(ybj_cgsq_hxbm);
		if (!(ybj_cgsq_hxbm.equals("")))	wheresql+=" and  (ybj_cgsq.hxbm='"+ybj_cgsq_hxbm+"')";
	}
	ybj_cgsq_hxmjbm=request.getParameter("ybj_cgsq_hxmjbm");
	if (ybj_cgsq_hxmjbm!=null)
	{
		ybj_cgsq_hxmjbm=cf.GB2Uni(ybj_cgsq_hxmjbm);
		if (!(ybj_cgsq_hxmjbm.equals("")))	wheresql+=" and  (ybj_cgsq.hxmjbm='"+ybj_cgsq_hxmjbm+"')";
	}
	ybj_cgsq_ysbm=request.getParameter("ybj_cgsq_ysbm");
	if (ybj_cgsq_ysbm!=null)
	{
		ybj_cgsq_ysbm=cf.GB2Uni(ybj_cgsq_ysbm);
		if (!(ybj_cgsq_ysbm.equals("")))	wheresql+=" and  (ybj_cgsq.ysbm='"+ybj_cgsq_ysbm+"')";
	}
	ybj_cgsq_sfyqd=request.getParameter("ybj_cgsq_sfyqd");
	if (ybj_cgsq_sfyqd!=null)
	{
		ybj_cgsq_sfyqd=cf.GB2Uni(ybj_cgsq_sfyqd);
		if (!(ybj_cgsq_sfyqd.equals("")))	wheresql+=" and  (ybj_cgsq.sfyqd='"+ybj_cgsq_sfyqd+"')";
	}
	ybj_cgsq_clzt=request.getParameter("ybj_cgsq_clzt");
	if (ybj_cgsq_clzt!=null)
	{
		ybj_cgsq_clzt=cf.GB2Uni(ybj_cgsq_clzt);
		if (!(ybj_cgsq_clzt.equals("")))	wheresql+=" and  (ybj_cgsq.clzt='"+ybj_cgsq_clzt+"')";
	}
	ybj_cgsq_khxm=request.getParameter("ybj_cgsq_khxm");
	if (ybj_cgsq_khxm!=null)
	{
		ybj_cgsq_khxm=cf.GB2Uni(ybj_cgsq_khxm);
		if (!(ybj_cgsq_khxm.equals("")))	khxxsql+=" and  (crm_khxx.khxm='"+ybj_cgsq_khxm+"')";
		if (!(ybj_cgsq_khxm.equals("")))	zxkhxxsql+=" and  (crm_zxkhxx.khxm='"+ybj_cgsq_khxm+"')";
	}
	ybj_cgsq_fwdz=request.getParameter("ybj_cgsq_fwdz");
	if (ybj_cgsq_fwdz!=null)
	{
		ybj_cgsq_fwdz=cf.GB2Uni(ybj_cgsq_fwdz);
		if (!(ybj_cgsq_fwdz.equals("")))	khxxsql+=" and  (crm_khxx.fwdz like '%"+ybj_cgsq_fwdz+"%')";
		if (!(ybj_cgsq_fwdz.equals("")))	zxkhxxsql+=" and  (crm_zxkhxx.fwdz like '%"+ybj_cgsq_fwdz+"%')";
	}
	ybj_cgsq_cqbm=request.getParameter("ybj_cgsq_cqbm");
	if (ybj_cgsq_cqbm!=null)
	{
		ybj_cgsq_cqbm=cf.GB2Uni(ybj_cgsq_cqbm);
		if (!(ybj_cgsq_cqbm.equals("")))	khxxsql+=" and  (crm_khxx.cqbm='"+ybj_cgsq_cqbm+"')";
		if (!(ybj_cgsq_cqbm.equals("")))	zxkhxxsql+=" and  (crm_zxkhxx.cqbm='"+ybj_cgsq_cqbm+"')";
	}
	ybj_cgsq_lxfs=request.getParameter("ybj_cgsq_lxfs");
	if (ybj_cgsq_lxfs!=null)
	{
		ybj_cgsq_lxfs=cf.GB2Uni(ybj_cgsq_lxfs);
		if (!(ybj_cgsq_lxfs.equals("")))	khxxsql+=" and  (crm_khxx.lxfs='"+ybj_cgsq_lxfs+"')";
		if (!(ybj_cgsq_lxfs.equals("")))	zxkhxxsql+=" and  (crm_zxkhxx.lxfs='"+ybj_cgsq_lxfs+"')";
	}
	ybj_cgsq_sjs=request.getParameter("ybj_cgsq_sjs");
	if (ybj_cgsq_sjs!=null)
	{
		ybj_cgsq_sjs=cf.GB2Uni(ybj_cgsq_sjs);
		if (!(ybj_cgsq_sjs.equals("")))	khxxsql+=" and  (crm_khxx.sjs='"+ybj_cgsq_sjs+"')";
		if (!(ybj_cgsq_sjs.equals("")))	zxkhxxsql+=" and  (crm_zxkhxx.sjs='"+ybj_cgsq_sjs+"')";
	}
	ybj_cgsq_bz=request.getParameter("ybj_cgsq_bz");
	if (ybj_cgsq_bz!=null)
	{
		ybj_cgsq_bz=cf.GB2Uni(ybj_cgsq_bz);
		if (!(ybj_cgsq_bz.equals("")))	wheresql+=" and  (ybj_cgsq.bz='"+ybj_cgsq_bz+"')";
	}
	ls_sql="SELECT ybj_cgsq.sqbh as sqbh,khxm,cqmc,fwdz,lxfs,sjs,fgflmc,zxjwmc,hxmc,hxmjmc,ysmc, DECODE(ybj_cgsq.sfyqd,'Y','��ǩ��','N','δǩ��'),sq_dwxx.dwmc,ybj_cgsq.sqr,ybj_cgsq.sqsj, DECODE(ybj_cgsq.clzt,'1','��������','2','���������','3','�ι����')";
	ls_sql+=" FROM dm_fgflbm,dm_hxmjbm,dm_hxbm,dm_ysbm,dm_zxjwbm,sq_dwxx,ybj_cgsq,dm_cqbm,crm_khxx  ";
    ls_sql+=" where ybj_cgsq.dwbh=sq_dwxx.dwbh and crm_khxx.cqbm=dm_cqbm.cqbm";
	ls_sql+=" and ybj_cgsq.ysbm=dm_ysbm.ysbm(+) and ybj_cgsq.hxbm=dm_hxbm.hxbm(+)";
	ls_sql+=" and ybj_cgsq.hxmjbm=dm_hxmjbm.hxmjbm(+) and ybj_cgsq.zxjwbm=dm_zxjwbm.zxjwbm(+)";
	ls_sql+=" and ybj_cgsq.fgflbm=dm_fgflbm.fgflbm(+)";
	ls_sql+=" and ybj_cgsq.khbh=crm_khxx.khbh and sfyqd='Y'";
    ls_sql+=wheresql;
    ls_sql+=khxxsql;

    ls_sql+=" union ";

	ls_sql+=" SELECT ybj_cgsq.sqbh as sqbh,khxm,cqmc,fwdz,lxfs,sjs,fgflmc,zxjwmc,hxmc,hxmjmc,ysmc, DECODE(ybj_cgsq.sfyqd,'Y','��ǩ��','N','δǩ��'),sq_dwxx.dwmc,ybj_cgsq.sqr,ybj_cgsq.sqsj, DECODE(ybj_cgsq.clzt,'1','��������','2','���������','3','�ι����')";
	ls_sql+=" FROM dm_fgflbm,dm_hxmjbm,dm_hxbm,dm_ysbm,dm_zxjwbm,sq_dwxx,ybj_cgsq,dm_cqbm,crm_zxkhxx  ";
    ls_sql+=" where ybj_cgsq.dwbh=sq_dwxx.dwbh and crm_zxkhxx.cqbm=dm_cqbm.cqbm";
	ls_sql+=" and ybj_cgsq.ysbm=dm_ysbm.ysbm(+) and ybj_cgsq.hxbm=dm_hxbm.hxbm(+)";
	ls_sql+=" and ybj_cgsq.hxmjbm=dm_hxmjbm.hxmjbm(+) and ybj_cgsq.zxjwbm=dm_zxjwbm.zxjwbm(+)";
	ls_sql+=" and ybj_cgsq.fgflbm=dm_fgflbm.fgflbm(+)";
	ls_sql+=" and ybj_cgsq.khbh=crm_zxkhxx.khbh and sfyqd='N'";
    ls_sql+=wheresql;
    ls_sql+=zxkhxxsql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Ybj_cgsqCxList.jsp","SelectCxYbj_cgsq.jsp","","fpybjMain.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqbh","sq_dwxx_dwmc","ybj_cgsq_sqr","ybj_cgsq_sqsj","ybj_cgsq_fgflbm","ybj_cgsq_zxjwbm","ybj_cgsq_hxbm","ybj_cgsq_hxmjbm","ybj_cgsq_ysbm","ybj_cgsq_clzt"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sqbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("����");
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/ybjgl/cgsq/ViewYbj_cgsq.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sqbh",coluParm);//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">���</td>
	<td  width="4%">����</td>
	<td  width="5%">����</td>
	<td  width="14%">���ݵ�ַ</td>
	<td  width="6%">��ϵ��ʽ</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">���</td>
	<td  width="6%">��λ</td>
	<td  width="5%">����</td>
	<td  width="6%">���</td>
	<td  width="4%">��ɫ</td>
	<td  width="5%">ǩ��</td>
	<td  width="8%">�������</td>
	<td  width="4%">������</td>
	<td  width="7%">����ʱ��</td>
	<td  width="7%">����״̬</td>
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