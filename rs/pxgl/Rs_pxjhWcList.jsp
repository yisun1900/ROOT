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
	String pxjhbh=null;
	String pxrs=null;
	String pxfy=null;
	String fgs=null;
	String jhzt=null;
	String shjl=null;
//	String jhkssj=null;
//	String jhjssj=null;
	String lrr=null;
	String ssfgs=null;
	String lrsj=null;
	String sfjhn=null;
	String pxjhmc=null;
	pxjhbh=request.getParameter("pxjhbh");
	if (pxjhbh!=null)
	{
		pxjhbh=cf.GB2Uni(pxjhbh);
		if (!(pxjhbh.equals("")))	wheresql+=" and  (pxjhbh='"+pxjhbh+"')";
	}
	pxjhmc=request.getParameter("pxjhmc");
	if (pxjhmc!=null)
	{
		pxjhmc=cf.GB2Uni(pxjhmc);
		if (!(pxjhmc.equals("")))	wheresql+=" and  (pxjhmc='"+pxjhmc+"')";
	}

	pxrs=request.getParameter("pxrs");
	if (pxrs!=null)
	{
		pxrs=pxrs.trim();
		if (!(pxrs.equals("")))	wheresql+=" and (pxrs="+pxrs+") ";
	}
	pxfy=request.getParameter("pxfy");
	if (pxfy!=null)
	{
		pxfy=pxfy.trim();
		if (!(pxfy.equals("")))	wheresql+=" and  (pxfy="+pxfy+") ";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (rs_pxjh.fgs='"+fgs+"')";
	}
	jhzt=request.getParameter("jhzt");
	if (jhzt!=null)
	{
		jhzt=cf.GB2Uni(jhzt);
		if (!(jhzt.equals("")))	wheresql+=" and  (rs_pxjh.jhzt='"+jhzt+"')";
	}
//	pxlx=request.getParameter("pxlx");
//	if (pxlx!=null)
//	{
//		pxlx=cf.GB2Uni(pxlx);
//		if (!(pxlx.equals("")))	wheresql+=" and  (pxlx='"+pxlx+"')";
//	}
	sfjhn=request.getParameter("sfjhn");
	if (sfjhn!=null)
	{
		sfjhn=cf.GB2Uni(sfjhn);
		if (!(sfjhn.equals("")))	wheresql+=" and  (sfjhn='"+sfjhn+"')";
	}
//	jhkssj=request.getParameter("jhkssj");
//	if (jhkssj!=null)
//	{
//		jhkssj=jhkssj.trim();
//		if (!(jhkssj.equals("")))	wheresql+="  and (jhkssj>=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
//	}
//	jhkssj=request.getParameter("jhkssj2");
//	if (jhkssj!=null)
//	{
//		jhkssj=jhkssj.trim();
//		if (!(jhkssj.equals("")))	wheresql+="  and (jhkssj<=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
//	}
//	jhjssj=request.getParameter("jhjssj");
//	if (jhjssj!=null)
//	{
//		jhjssj=jhjssj.trim();
//		if (!(jhjssj.equals("")))	wheresql+="  and (jhjssj>=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
//	}
//	jhjssj=request.getParameter("jhjssj2");
//	if (jhjssj!=null)
//	{
//		jhjssj=jhjssj.trim();
//		if (!(jhjssj.equals("")))	wheresql+="  and (jhjssj<=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
//	}

	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_pxjh.ssfgs='"+ssfgs+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT pxjhmc,pxjhbh,pxrs,pxfy,a.dwmc fgs,DECODE(jhzt,'0','¼��δ���','1','�ȴ�����','2','����������','3','��ѵ���','4','����δͨ��','5','�޸ļƻ�','6','������'),DECODE(sfjhn,'0','�ƻ���','1','�ƻ���'),lrr,b.dwmc ssfgs,lrsj  ";
	ls_sql+=" FROM rs_pxjh,rs_pxshbm,sq_dwxx a,sq_dwxx b,rs_ztbm  ";
    ls_sql+=" where rs_pxshbm.shjl=rs_pxjh.shjl and a.dwbh=rs_pxjh.fgs and b.dwbh=rs_pxjh.ssfgs and rs_ztbm.ztbm=rs_pxjh.ztbm and rs_pxjh.jhzt='6' ";
    ls_sql+=wheresql;
	ls_sql+=" order by pxjhbh asc";
    pageObj.sql=ls_sql;


//		ls_sql="SELECT pxjhbh,pxrs,pxfy,a.dwmc fgs,jhzt,ztbm,rs_pxjh.shjlmc shjl,jhkssj,jhjssj,lrr,b.dwmc ssfgs,lrsj  ";
//	ls_sql+=" FROM rs_pxjh,sq_dwxx a,sq_dwxx b,rs_pxshbm  ";
//    ls_sql+=" where a.dwbh='"+fgs+"' and b.dwbh='"+ssfgs+"' and rs_pxshbm.shjl='"+shjl+"'";
//    ls_sql+=wheresql;
//    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("Rs_pxjhCxList.jsp","SelectCxRs_pxjh.jsp","","InsertRs_pxjhjg.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pxjhbh","pxrs","pxfy","fgs","jhzt","ztbm","shjl","jhkssj","jhjssj","lrr","ssfgs","lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pxjhbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("¼��");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"pxjhbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="viewpxjhmx.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("pxjhbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="17%">��ѵ�ƻ�����</td>
	<td  width="9%">��ѵ�ƻ����</td>
	<td  width="7%">��ѵ����</td>
	<td  width="7%">��ѵ����</td>
	<td  width="9%">�����ֹ�˾</td>
	<td  width="9%">�ƻ�״̬</td>
	<td  width="9%">�Ƿ�ƻ���</td>
	<td  width="9%">¼����</td>
	<td  width="11%">¼���˷ֹ�˾</td>
	<td  width="9%">¼��ʱ��</td>
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