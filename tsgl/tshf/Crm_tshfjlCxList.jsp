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
	String crm_tshfjl_hfjlh=null;
	String crm_tshfjl_tsjlh=null;
	String crm_tshfjl_khbh=null;
	String crm_tshfjl_khhfqk=null;
	String crm_tshfjl_cxxwt=null;
	String crm_tshfjl_hfsj=null;
	String crm_tshfjl_hfr=null;
	String[] crm_tshfjl_hfjgbm=null;
	String crm_tsjl_sfxhf=null;
	String crm_tsjl_clzt=null;

	String crm_tsjl_khbh=null;
	String crm_tsjl_khxm=null;
	String crm_tsjl_fwdz=null;
	String crm_tsjl_lxfs=null;
	String crm_tsjl_sjs=null;
	String crm_tsjl_sgd=null;
	String crm_tsjl_zjy=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_tshfjl.hfbm in(select dwbh from sq_dwxx where dwlx in('A0','A1','F0','F1') and ssdw='"+fgs+"'))";

	String hfbm=null;
	hfbm=request.getParameter("hfbm");
	if (!(hfbm.equals("")))	wheresql+=" and  (crm_tshfjl.hfbm='"+hfbm+"')";
	
	
	crm_tsjl_khbh=request.getParameter("crm_tsjl_khbh");
	if (crm_tsjl_khbh!=null)
	{
		crm_tsjl_khbh=cf.GB2Uni(crm_tsjl_khbh);
		if (!(crm_tsjl_khbh.equals("")))	wheresql+=" and  (crm_tshfjl.khbh='"+crm_tsjl_khbh+"')";
	}
	crm_tsjl_khxm=request.getParameter("crm_tsjl_khxm");
	if (crm_tsjl_khxm!=null)
	{
		crm_tsjl_khxm=cf.GB2Uni(crm_tsjl_khxm);
		if (!(crm_tsjl_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_tsjl_khxm+"')";
	}
	crm_tsjl_fwdz=request.getParameter("crm_tsjl_fwdz");
	if (crm_tsjl_fwdz!=null)
	{
		crm_tsjl_fwdz=cf.GB2Uni(crm_tsjl_fwdz);
		if (!(crm_tsjl_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_tsjl_fwdz+"%')";
	}
	crm_tsjl_lxfs=request.getParameter("crm_tsjl_lxfs");
	if (crm_tsjl_lxfs!=null)
	{
		crm_tsjl_lxfs=cf.GB2Uni(crm_tsjl_lxfs);
		if (!(crm_tsjl_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_tsjl_lxfs+"')";
	}
	crm_tsjl_sjs=request.getParameter("crm_tsjl_sjs");
	if (crm_tsjl_sjs!=null)
	{
		crm_tsjl_sjs=cf.GB2Uni(crm_tsjl_sjs);
		if (!(crm_tsjl_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_tsjl_sjs+"')";
	}
	crm_tsjl_sgd=request.getParameter("crm_tsjl_sgd");
	if (crm_tsjl_sgd!=null)
	{
		crm_tsjl_sgd=cf.GB2Uni(crm_tsjl_sgd);
		if (!(crm_tsjl_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_tsjl_sgd+"')";
	}
	crm_tsjl_zjy=request.getParameter("crm_tsjl_zjy");
	if (crm_tsjl_zjy!=null)
	{
		crm_tsjl_zjy=cf.GB2Uni(crm_tsjl_zjy);
		if (!(crm_tsjl_zjy.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_tsjl_zjy+"')";
	}
	
	
	
	crm_tshfjl_hfjlh=request.getParameter("crm_tshfjl_hfjlh");
	if (crm_tshfjl_hfjlh!=null)
	{
		crm_tshfjl_hfjlh=crm_tshfjl_hfjlh.trim();
		if (!(crm_tshfjl_hfjlh.equals("")))	wheresql+=" and (crm_tshfjl.hfjlh="+crm_tshfjl_hfjlh+") ";
	}

	crm_tshfjl_khhfqk=request.getParameter("crm_tshfjl_khhfqk");
	if (crm_tshfjl_khhfqk!=null)
	{
		crm_tshfjl_khhfqk=cf.GB2Uni(crm_tshfjl_khhfqk);
		if (!(crm_tshfjl_khhfqk.equals("")))	wheresql+=" and  (crm_tshfjl.khhfqk like '%"+crm_tshfjl_khhfqk+"%')";
	}
	crm_tshfjl_cxxwt=request.getParameter("crm_tshfjl_cxxwt");
	if (crm_tshfjl_cxxwt!=null)
	{
		crm_tshfjl_cxxwt=cf.GB2Uni(crm_tshfjl_cxxwt);
		if (!(crm_tshfjl_cxxwt.equals("")))	wheresql+=" and  (crm_tshfjl.cxxwt like '%"+crm_tshfjl_cxxwt+"%')";
	}
	crm_tshfjl_hfsj=request.getParameter("crm_tshfjl_hfsj");
	if (crm_tshfjl_hfsj!=null)
	{
		crm_tshfjl_hfsj=crm_tshfjl_hfsj.trim();
		if (!(crm_tshfjl_hfsj.equals("")))	wheresql+="  and (crm_tshfjl.hfsj>=TO_DATE('"+crm_tshfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_tshfjl_hfsj=request.getParameter("crm_tshfjl_hfsj2");
	if (crm_tshfjl_hfsj!=null)
	{
		crm_tshfjl_hfsj=crm_tshfjl_hfsj.trim();
		if (!(crm_tshfjl_hfsj.equals("")))	wheresql+="  and (crm_tshfjl.hfsj<=TO_DATE('"+crm_tshfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_tshfjl_hfr=request.getParameter("crm_tshfjl_hfr");
	if (crm_tshfjl_hfr!=null)
	{
		crm_tshfjl_hfr=cf.GB2Uni(crm_tshfjl_hfr);
		if (!(crm_tshfjl_hfr.equals("")))	wheresql+=" and  (crm_tshfjl.hfr='"+crm_tshfjl_hfr+"')";
	}


	ls_sql="SELECT crm_tshfjl.hfjlh as hfjlh,crm_tshfjl.khbh as khbh,crm_khxx.khxm as khxm,crm_tshfjl.khhfqk,crm_tshfjl.cxxwt,crm_tshfjl.hfsj,crm_tshfjl.hfr,dwmc ";
	ls_sql+=" FROM crm_tshfjl,crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_tshfjl.khbh=crm_khxx.khbh(+) and crm_tshfjl.hfbm=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_tshfjl.hfsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_tshfjlCxList.jsp","SelectCxCrm_tshfjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"hfjlh","khbh","khxm","khhfqk","cxxwt","hfsj","hfr","dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[2]="align='left'";
	pageObj.alignStr[3]="align='left'";


//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("crm_tshfjl_tsjlh","1");//�в����������Hash��
	spanColHash.put("crm_tshfjl_khbh","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hfjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/tsgl/tshf/ViewCrm_tshfjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hfjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�ط����</td>
	<td  width="6%">�ͻ����</td>
	<td  width="5%">�ͻ�</td>
	<td  width="30%">�ͻ��ط����</td>
	<td  width="30%">�ط��г��ֵ�������</td>
	<td  width="8%">�ط�ʱ��</td>
	<td  width="5%">�ط���</td>
	<td  width="10%">�طò���</td>
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