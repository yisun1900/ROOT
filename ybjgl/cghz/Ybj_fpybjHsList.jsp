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
	String ybj_fpybj_sqbh=null;
	String ybj_fpybj_fpr=null;
	String ybj_fpybj_fpsj=null;
	String ybj_fpybj_clzt=null;
	String ybj_cgsq_dwbh=null;
	String ybj_cgsq_sqr=null;
	String ybj_cgsq_sqsj=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hxbm=null;
	String crm_khxx_fgflbm=null;
	String crm_khxx_zxjwbm=null;
	String crm_khxx_hxmjbm=null;
	String crm_khxx_ysbm=null;
	String cgmyd=null;
	String hsjg=null;
	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (ybj_cgsq.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";


	cgmyd=request.getParameter("cgmyd");
	if (cgmyd!=null)
	{
		if (!(cgmyd.equals("")))	wheresql+=" and (ybj_fpybj.cgmyd='"+cgmyd+"') ";
	}
	hsjg=request.getParameter("hsjg");
	if (hsjg!=null)
	{
		if (!(hsjg.equals("")))	wheresql+=" and (ybj_fpybj.hsjg='"+hsjg+"') ";
	}

	ybj_fpybj_sqbh=request.getParameter("ybj_fpybj_sqbh");
	if (ybj_fpybj_sqbh!=null)
	{
		ybj_fpybj_sqbh=ybj_fpybj_sqbh.trim();
		if (!(ybj_fpybj_sqbh.equals("")))	wheresql+=" and (ybj_fpybj.sqbh="+ybj_fpybj_sqbh+") ";
	}
	ybj_fpybj_fpr=request.getParameter("ybj_fpybj_fpr");
	if (ybj_fpybj_fpr!=null)
	{
		ybj_fpybj_fpr=cf.GB2Uni(ybj_fpybj_fpr);
		if (!(ybj_fpybj_fpr.equals("")))	wheresql+=" and  (ybj_fpybj.fpr='"+ybj_fpybj_fpr+"')";
	}
	ybj_fpybj_fpsj=request.getParameter("ybj_fpybj_fpsj");
	if (ybj_fpybj_fpsj!=null)
	{
		ybj_fpybj_fpsj=ybj_fpybj_fpsj.trim();
		if (!(ybj_fpybj_fpsj.equals("")))	wheresql+="  and (ybj_fpybj.fpsj>=TO_DATE('"+ybj_fpybj_fpsj+"','YYYY/MM/DD'))";
	}
	ybj_fpybj_fpsj=request.getParameter("ybj_fpybj_fpsj2");
	if (ybj_fpybj_fpsj!=null)
	{
		ybj_fpybj_fpsj=ybj_fpybj_fpsj.trim();
		if (!(ybj_fpybj_fpsj.equals("")))	wheresql+="  and (ybj_fpybj.fpsj<=TO_DATE('"+ybj_fpybj_fpsj+"','YYYY/MM/DD'))";
	}
	ybj_fpybj_clzt=request.getParameter("ybj_fpybj_clzt");
	if (ybj_fpybj_clzt!=null)
	{
		ybj_fpybj_clzt=cf.GB2Uni(ybj_fpybj_clzt);
		if (!(ybj_fpybj_clzt.equals("")))	wheresql+=" and  (ybj_fpybj.clzt='"+ybj_fpybj_clzt+"')";
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
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (c.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (c.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_hxbm=request.getParameter("crm_khxx_hxbm");
	if (crm_khxx_hxbm!=null)
	{
		crm_khxx_hxbm=cf.GB2Uni(crm_khxx_hxbm);
		if (!(crm_khxx_hxbm.equals("")))	wheresql+=" and  (c.hxbm='"+crm_khxx_hxbm+"')";
	}
	crm_khxx_fgflbm=request.getParameter("crm_khxx_fgflbm");
	if (crm_khxx_fgflbm!=null)
	{
		crm_khxx_fgflbm=cf.GB2Uni(crm_khxx_fgflbm);
		if (!(crm_khxx_fgflbm.equals("")))	wheresql+=" and  (c.fgflbm='"+crm_khxx_fgflbm+"')";
	}
	crm_khxx_zxjwbm=request.getParameter("crm_khxx_zxjwbm");
	if (crm_khxx_zxjwbm!=null)
	{
		crm_khxx_zxjwbm=cf.GB2Uni(crm_khxx_zxjwbm);
		if (!(crm_khxx_zxjwbm.equals("")))	wheresql+=" and  (c.zxjwbm='"+crm_khxx_zxjwbm+"')";
	}
	crm_khxx_hxmjbm=request.getParameter("crm_khxx_hxmjbm");
	if (crm_khxx_hxmjbm!=null)
	{
		crm_khxx_hxmjbm=cf.GB2Uni(crm_khxx_hxmjbm);
		if (!(crm_khxx_hxmjbm.equals("")))	wheresql+=" and  (c.hxmjbm='"+crm_khxx_hxmjbm+"')";
	}
	crm_khxx_ysbm=request.getParameter("crm_khxx_ysbm");
	if (crm_khxx_ysbm!=null)
	{
		crm_khxx_ysbm=cf.GB2Uni(crm_khxx_ysbm);
		if (!(crm_khxx_ysbm.equals("")))	wheresql+=" and  (c.ysbm='"+crm_khxx_ysbm+"')";
	}
	ls_sql="SELECT ybj_fpybj.sqbh as sqbh,d.khxm cgkhxm,a.dwmc sbdm,ybj_fpybj.fpsj,ybj_fpybj.khbh as khbh,sgdmc sgd,DECODE(ybj_fpybj.clzt,'N','δд��ִ','Y','��д��ִ','H','�Ѻ�ʵ'),DECODE(ybj_fpybj.cgmyd,'Y','����','N','������'),DECODE(ybj_fpybj.hsjg,'Y','��ʵ','N','����ʵ'),c.khxm,c.fwdz  ";
	ls_sql+=" FROM crm_khxx c,crm_khxx d,ybj_cgsq,ybj_fpybj,sq_dwxx a,sq_sgd";
    ls_sql+=" where ybj_fpybj.khbh=c.khbh and ybj_fpybj.sqbh=ybj_cgsq.sqbh ";
    ls_sql+=" and ybj_cgsq.dwbh=a.dwbh and c.sgd=sq_sgd.sgd";
	ls_sql+=" and ybj_cgsq.khbh=d.khbh and sfyqd='Y'";
    ls_sql+=wheresql;

    ls_sql+=" union ";

	ls_sql+=" SELECT ybj_fpybj.sqbh as sqbh,d.khxm cgkhxm,a.dwmc sbdm,ybj_fpybj.fpsj,ybj_fpybj.khbh as khbh,sgdmc sgd,DECODE(ybj_fpybj.clzt,'N','δд��ִ','Y','��д��ִ','H','�Ѻ�ʵ'),DECODE(ybj_fpybj.cgmyd,'Y','����','N','������'),DECODE(ybj_fpybj.hsjg,'Y','��ʵ','N','����ʵ'),c.khxm,c.fwdz  ";
	ls_sql+=" FROM crm_khxx c,crm_zxkhxx d,ybj_cgsq,ybj_fpybj,sq_dwxx a,sq_sgd ";
    ls_sql+=" where ybj_fpybj.khbh=c.khbh and ybj_fpybj.sqbh=ybj_cgsq.sqbh ";
    ls_sql+=" and ybj_cgsq.dwbh=a.dwbh and c.sgd=sq_sgd.sgd";
	ls_sql+=" and ybj_cgsq.khbh=d.khbh and sfyqd='N'";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Ybj_fpybjHsList.jsp","SelectHsYbj_fpybj.jsp","","HsYbj_fpybj.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqbh","ybj_fpybj_fpsj","ybj_cgsq_dwbh","khbh","crm_khxx_khxm","crm_khxx_fwdz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sqbh","khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("��ʵ");
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

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sqbh","1");//�в����������Hash��
	spanColHash.put("cgkhxm","1");//�в����������Hash��
	spanColHash.put("sbdm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="7%">������</td>
	<td  width="6%">����ͻ�</td>
	<td  width="12%">�������</td>
	<td  width="8%">����ʱ��</td>
	<td  width="8%">�������</td>
	<td  width="6%">ʩ����</td>
	<td  width="6%">����״̬</td>
	<td  width="6%">�ι������</td>
	<td  width="6%">��ʵ���</td>
	<td  width="6%">�����ͻ�</td>
	<td  width="26%">������ַ</td>
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