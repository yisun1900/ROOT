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
	String ckph=null;
	String dwbh=null;
	String khbh=null;
	String ckzsl=null;
	String ckzje=null;
	String ckzt=null;
	String lrr=null;
	String lrsj=null;
	String shqrr=null;
	String shqrsj=null;
	String bz=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String fgs=null;

	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cl_ckd.dwbh='"+fgs+"')";
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs like '%"+lxfs+"%')";
	}
	ckph=request.getParameter("ckph");
	if (ckph!=null)
	{
		ckph=cf.GB2Uni(ckph);
		if (!(ckph.equals("")))	wheresql+=" and  (ckph='"+ckph+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (cl_ckd.khbh='"+khbh+"')";
	}
	ckzsl=request.getParameter("ckzsl");
	if (ckzsl!=null)
	{
		ckzsl=ckzsl.trim();
		if (!(ckzsl.equals("")))	wheresql+=" and  (ckzsl>="+ckzsl+") ";
	}
	ckzsl=request.getParameter("ckzsl2");
	if (ckzsl!=null)
	{
		ckzsl=ckzsl.trim();
		if (!(ckzsl.equals("")))	wheresql+=" and  (ckzsl<="+ckzsl+") ";
	}
	ckzje=request.getParameter("ckzje");
	if (ckzje!=null)
	{
		ckzje=ckzje.trim();
		if (!(ckzje.equals("")))	wheresql+=" and  (ckzje>="+ckzje+") ";
	}
	ckzje=request.getParameter("ckzje2");
	if (ckzje!=null)
	{
		ckzje=ckzje.trim();
		if (!(ckzje.equals("")))	wheresql+=" and  (ckzje<="+ckzje+") ";
	}
	ckzt=request.getParameter("ckzt");
	if (ckzt!=null)
	{
		ckzt=cf.GB2Uni(ckzt);
		if (!(ckzt.equals("")))	wheresql+=" and  (ckzt='"+ckzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cl_ckd.lrr='"+lrr+"')";
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
	shqrr=request.getParameter("shqrr");
	if (shqrr!=null)
	{
		shqrr=cf.GB2Uni(shqrr);
		if (!(shqrr.equals("")))	wheresql+=" and  (shqrr='"+shqrr+"')";
	}
	shqrsj=request.getParameter("shqrsj");
	if (shqrsj!=null)
	{
		shqrsj=shqrsj.trim();
		if (!(shqrsj.equals("")))	wheresql+="  and (shqrsj>=TO_DATE('"+shqrsj+"','YYYY/MM/DD'))";
	}
	shqrsj=request.getParameter("shqrsj2");
	if (shqrsj!=null)
	{
		shqrsj=shqrsj.trim();
		if (!(shqrsj.equals("")))	wheresql+="  and (shqrsj<=TO_DATE('"+shqrsj+"','YYYY/MM/DD'))";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (bz='"+bz+"')";
	}
	ls_sql="SELECT DECODE(cl_ckd.ckzt,'1','<a href=tjckd.jsp?ckph='||cl_ckd.ckph||' target=\"_back\">�ύ����</a>','2','���ύ','3','�ȴ����','4','�ͻ�ȷ��') ckzt,cl_ckd.ckph ckph,dwmc,cl_ckd.khbh khbh,'<a href=/khxx/ViewCrm_khxx.jsp?khbh='||cl_ckd.khbh||' target=\"_back\">'||khxm||'</a>' khxm,cl_ckd.ckzsl,cl_ckd.ckzje,cl_ckd.lrr,cl_ckd.lrsj,cl_ckd.bz ";
	ls_sql+=" FROM cl_ckd,sq_dwxx,crm_khxx ";
    ls_sql+=" where cl_ckd.dwbh=sq_dwxx.dwbh(+) and cl_ckd.khbh=crm_khxx.khbh(+) and  cl_ckd.ckzt='1' ";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_ckd.ckph";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cl_ckdTjList.jsp","SelectTjCl_ckd.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ckph","dwbh","khbh","ckzsl","ckzje","ckzt","lrr","lrsj","shqrr","shqrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ckph"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ckph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="viewckmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ckph",coluParm);//�в����������Hash��
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
  <B><font size="3">�ύ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����״̬</td>
	<td  width="7%">��������</td>
	<td  width="9%">���ⵥλ</td>
	<td  width="5%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="5%">����������</td>
	<td  width="5%">�����ܽ��</td>
	<td  width="6%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="24%">��ע</td>
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