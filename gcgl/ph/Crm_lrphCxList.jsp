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
	String lrph=null;
	String lrr=null;
	String lrsj=null;
	String zdxh=null;
	String sl=null;
	String lx=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_lrph.dwbh in(select dwbh from sq_dwxx where ssdw='"+fgs+"'))";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and (crm_lrph.dwbh='"+dwbh+"') ";
	}

	lrph=request.getParameter("lrph");
	if (lrph!=null)
	{
		lrph=lrph.trim();
		if (!(lrph.equals("")))	wheresql+=" and (crm_lrph.lrph="+lrph+") ";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_lrph.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_lrph.lrsj=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	zdxh=request.getParameter("zdxh");
	if (zdxh!=null)
	{
		zdxh=zdxh.trim();
		if (!(zdxh.equals("")))	wheresql+=" and (crm_lrph.zdxh="+zdxh+") ";
	}
	sl=request.getParameter("sl");
	if (sl!=null)
	{
		sl=sl.trim();
		if (!(sl.equals("")))	wheresql+=" and (crm_lrph.sl="+sl+") ";
	}
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (crm_lrph.lx='"+lx+"')";
	}
	ls_sql="SELECT lrph,lrr,lrsj,dwmc,TO_CHAR(zdxh),sl, DECODE(lx,'1','��������','2','���ι�������','3','�깤����','4','�蹤�̵���','5','�깤�ط�'),crm_lrph.bz  ";
	ls_sql+=" FROM crm_lrph,sq_dwxx  ";
    ls_sql+=" where crm_lrph.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by lrph";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_lrphCxList.jsp","SelectCxCrm_lrph.jsp","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"lrph","lrr","lrsj","zdxh","sl","lx","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"lrph"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"lrph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="Crm_lrphmxCxList.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("lrph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
/*
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">����</td>
	<td  width="14%">¼����</td>
	<td  width="14%">¼��ʱ��</td>
	<td  width="14%">¼�뵥λ</td>
	<td  width="8%">������</td>
	<td  width="8%">����</td>
	<td  width="12%">����</td>
	<td  width="30%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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
