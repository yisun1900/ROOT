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
	String wtbh=null;
	String dcqs=null;
	String wtmc=null;
	String sfkdx=null;
	String wtsfgq=null;
	String wtfl=null;
	String xwtsm=null;
	String lrr=null;
	String lrsj1=null;
	String lrsj2=null;
	lrsj1=request.getParameter("lrsj1");
	lrsj2=request.getParameter("lrsj2");

	lrr=request.getParameter("lrr");
	if(lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}


	wtbh=request.getParameter("wtbh");
	if (wtbh!=null)
	{
		wtbh=cf.GB2Uni(wtbh);
		if (!(wtbh.equals("")))	wheresql+=" and  (wtbh='"+wtbh+"')";
	}
	dcqs=request.getParameter("dcqs");
	if (dcqs!=null)
	{
		dcqs=cf.GB2Uni(dcqs);
		if (!(dcqs.equals("")))	wheresql+=" and  (dcqs='"+dcqs+"')";
	}
	wtmc=request.getParameter("wtmc");
	if (wtmc!=null)
	{
		wtmc=cf.GB2Uni(wtmc);
		if (!(wtmc.equals("")))	wheresql+=" and  (wtmc='"+wtmc+"')";
	}
	sfkdx=request.getParameter("sfkdx");
	if (sfkdx!=null)
	{
		sfkdx=cf.GB2Uni(sfkdx);
		if (!(sfkdx.equals("")))	wheresql+=" and  (sfkdx='"+sfkdx+"')";
	}
	wtsfgq=request.getParameter("wtsfgq");
	if (wtsfgq!=null)
	{
		wtsfgq=cf.GB2Uni(wtsfgq);
		if (!(wtsfgq.equals("")))	wheresql+=" and  (wtsfgq='"+wtsfgq+"')";
	}
	wtfl=request.getParameter("wtfl");
	if (wtfl!=null)
	{
		wtfl=cf.GB2Uni(wtfl);
		if (!(wtfl.equals("")))	wheresql+=" and  (wtfl='"+wtfl+"')";
	}
	xwtsm=request.getParameter("xwtsm");
	if (xwtsm!=null)
	{
		xwtsm=cf.GB2Uni(xwtsm);
		if (!(xwtsm.equals("")))	wheresql+=" and  (xwtsm='"+xwtsm+"')";
	}
	ls_sql="SELECT wtbh,dcqs,wtmc, DECODE(sfkdx,'Y','�ɶ�ѡ','N','��ѡ'), DECODE(wtsfgq,'Y','����','N','δ����'),wtfl,xwtsm  ";
	ls_sql+=" FROM hd_scdcwt  ";
    ls_sql+=" where (1=1)";
	if (lrsj1!=null && (!(lrsj1.equals(""))))
	{
		ls_sql+=" and lrsj>=to_Date('"+lrsj1+"','YYYY-MM-DD') ";
	}
	if (lrsj2!=null && (!(lrsj2.equals(""))))
	{
			ls_sql+=" and lrsj<=to_Date('"+lrsj2+"23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	}
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hd_scdcwtList.jsp","yjdcwh.jsp","","EditHd_scdcwt.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"wtbh","dcqs","wtmc","sfkdx","wtsfgq","wtfl","xwtsm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"wtbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteHd_scdcwtList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="12%">������</td>
	<td  width="12%">��������</td>
	<td  width="12%">��������</td>
	<td  width="12%">�Ƿ�ɶ�ѡ</td>
	<td  width="12%">�����Ƿ����</td>
	<td  width="12%">�������</td>
	<td  width="12%">����˵��</td>
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