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
	String yy_jjb_zqs=null;
	String yy_jjb_yy_jjb_ygmc=null;
	String yy_jjb_ssbm=null;
	String yy_jjb_ssfgs=null;
	String yy_jjb_yy_jjbqntq=null;
	String yy_jjb_yy_jjbbyjh=null;
	String yy_jjb_yy_jjbylj=null;
	String yy_jjb_yy_jjbdmbylj=null;
	String yy_jjb_yy_jjbszjh=null;
	String yy_jjb_yy_jjbszwc=null;
	String yy_jjb_yy_jjbbzyj=null;
	String yy_jjb_yy_jjb_lrsj=null;
	String yy_jjb_yy_jjb_lrr=null;
	yy_jjb_zqs=request.getParameter("yy_jjb_zqs");
	if (yy_jjb_zqs!=null)
	{
		yy_jjb_zqs=yy_jjb_zqs.trim();
		if (!(yy_jjb_zqs.equals("")))	wheresql+=" and (yy_jjb.zqs="+yy_jjb_zqs+") ";
	}
	yy_jjb_yy_jjb_ygmc=request.getParameter("yy_jjb_yy_jjb_ygmc");
	if (yy_jjb_yy_jjb_ygmc!=null)
	{
		yy_jjb_yy_jjb_ygmc=cf.GB2Uni(yy_jjb_yy_jjb_ygmc);
		if (!(yy_jjb_yy_jjb_ygmc.equals("")))	wheresql+=" and  (yy_jjb.yy_jjb_ygmc='"+yy_jjb_yy_jjb_ygmc+"')";
	}
	yy_jjb_ssbm=request.getParameter("yy_jjb_ssbm");
	if (yy_jjb_ssbm!=null)
	{
		yy_jjb_ssbm=cf.GB2Uni(yy_jjb_ssbm);
		if (!(yy_jjb_ssbm.equals("")))	wheresql+=" and  (yy_jjb.ssbm='"+yy_jjb_ssbm+"')";
	}
	yy_jjb_ssfgs=request.getParameter("yy_jjb_ssfgs");
	if (yy_jjb_ssfgs!=null)
	{
		yy_jjb_ssfgs=cf.GB2Uni(yy_jjb_ssfgs);
		if (!(yy_jjb_ssfgs.equals("")))	wheresql+=" and  (yy_jjb.ssfgs='"+yy_jjb_ssfgs+"')";
	}
	yy_jjb_yy_jjbqntq=request.getParameter("yy_jjb_yy_jjbqntq");
	if (yy_jjb_yy_jjbqntq!=null)
	{
		yy_jjb_yy_jjbqntq=yy_jjb_yy_jjbqntq.trim();
		if (!(yy_jjb_yy_jjbqntq.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbqntq="+yy_jjb_yy_jjbqntq+") ";
	}
	yy_jjb_yy_jjbbyjh=request.getParameter("yy_jjb_yy_jjbbyjh");
	if (yy_jjb_yy_jjbbyjh!=null)
	{
		yy_jjb_yy_jjbbyjh=yy_jjb_yy_jjbbyjh.trim();
		if (!(yy_jjb_yy_jjbbyjh.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbbyjh="+yy_jjb_yy_jjbbyjh+") ";
	}
	yy_jjb_yy_jjbylj=request.getParameter("yy_jjb_yy_jjbylj");
	if (yy_jjb_yy_jjbylj!=null)
	{
		yy_jjb_yy_jjbylj=yy_jjb_yy_jjbylj.trim();
		if (!(yy_jjb_yy_jjbylj.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbylj="+yy_jjb_yy_jjbylj+") ";
	}
	yy_jjb_yy_jjbdmbylj=request.getParameter("yy_jjb_yy_jjbdmbylj");
	if (yy_jjb_yy_jjbdmbylj!=null)
	{
		yy_jjb_yy_jjbdmbylj=yy_jjb_yy_jjbdmbylj.trim();
		if (!(yy_jjb_yy_jjbdmbylj.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbdmbylj="+yy_jjb_yy_jjbdmbylj+") ";
	}
	yy_jjb_yy_jjbszjh=request.getParameter("yy_jjb_yy_jjbszjh");
	if (yy_jjb_yy_jjbszjh!=null)
	{
		yy_jjb_yy_jjbszjh=yy_jjb_yy_jjbszjh.trim();
		if (!(yy_jjb_yy_jjbszjh.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbszjh="+yy_jjb_yy_jjbszjh+") ";
	}
	yy_jjb_yy_jjbszwc=request.getParameter("yy_jjb_yy_jjbszwc");
	if (yy_jjb_yy_jjbszwc!=null)
	{
		yy_jjb_yy_jjbszwc=yy_jjb_yy_jjbszwc.trim();
		if (!(yy_jjb_yy_jjbszwc.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbszwc="+yy_jjb_yy_jjbszwc+") ";
	}
	yy_jjb_yy_jjbbzyj=request.getParameter("yy_jjb_yy_jjbbzyj");
	if (yy_jjb_yy_jjbbzyj!=null)
	{
		yy_jjb_yy_jjbbzyj=yy_jjb_yy_jjbbzyj.trim();
		if (!(yy_jjb_yy_jjbbzyj.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbbzyj="+yy_jjb_yy_jjbbzyj+") ";
	}
	yy_jjb_yy_jjb_lrsj=request.getParameter("yy_jjb_yy_jjb_lrsj");
	if (yy_jjb_yy_jjb_lrsj!=null)
	{
		yy_jjb_yy_jjb_lrsj=yy_jjb_yy_jjb_lrsj.trim();
		if (!(yy_jjb_yy_jjb_lrsj.equals("")))	wheresql+="  and (yy_jjb.yy_jjb_lrsj>=TO_DATE('"+yy_jjb_yy_jjb_lrsj+"','YYYY/MM/DD'))";
	}
	yy_jjb_yy_jjb_lrsj=request.getParameter("yy_jjb_yy_jjb_lrsj2");
	if (yy_jjb_yy_jjb_lrsj!=null)
	{
		yy_jjb_yy_jjb_lrsj=yy_jjb_yy_jjb_lrsj.trim();
		if (!(yy_jjb_yy_jjb_lrsj.equals("")))	wheresql+="  and (yy_jjb.yy_jjb_lrsj<=TO_DATE('"+yy_jjb_yy_jjb_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	yy_jjb_yy_jjb_lrr=request.getParameter("yy_jjb_yy_jjb_lrr");
	if (yy_jjb_yy_jjb_lrr!=null)
	{
		yy_jjb_yy_jjb_lrr=cf.GB2Uni(yy_jjb_yy_jjb_lrr);
		if (!(yy_jjb_yy_jjb_lrr.equals("")))	wheresql+=" and  (yy_jjb.yy_jjb_lrr='"+yy_jjb_yy_jjb_lrr+"')";
	}
	ls_sql="SELECT yy_jjb.zqs,yy_jjb.yy_jjb_ygmc,a.dwmc ssbm,b.dwmc ssfgs,yy_jjb.yy_jjbqntq,yy_jjb.yy_jjbbyjh,yy_jjb.yy_jjbylj,yy_jjb.yy_jjbdmbylj,yy_jjb.yy_jjbszjh,yy_jjb.yy_jjbszwc,yy_jjb.yy_jjbbzyj,yy_jjb.yy_jjb_lrsj,yy_jjb.yy_jjb_lrr  ";
	ls_sql+=" FROM yy_jjb,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where yy_jjb.ssbm=a.dwbh(+)";
    ls_sql+=" and yy_jjb.ssfgs=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_jjb.zqs,yy_jjb.ssbm,yy_jjb.yy_jjb_ygmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yy_jjbList.jsp","","","EditYy_jjb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zqs","yy_jjb_ygmc","sq_dwxx_dwmc","yy_jjb_ssfgs","yy_jjb_yy_jjbqntq","yy_jjb_yy_jjbbyjh","yy_jjb_yy_jjbylj","yy_jjb_yy_jjbdmbylj","yy_jjb_yy_jjbszjh","yy_jjb_yy_jjbszwc","yy_jjb_yy_jjbbzyj","yy_jjb_yy_jjb_lrsj","yy_jjb_yy_jjb_lrr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zqs","yy_jjb_ygmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Yy_jjbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
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
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from yy_jjb where "+chooseitem;
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="6%">������</td>
	<td  width="6%">�ҾӲ�Ա������</td>
	<td  width="9%">��������</td>
	<td  width="8%">�����ֹ�˾</td>
	<td  width="8%">ȥ��ͬ���¶����Ĳ�ֵ</td>
	<td  width="7%">���¼ƻ�</td>
	<td  width="7%">�����ۼ�</td>
	<td  width="7%">�������汾���ۼƹ��̲�ֵ</td>
	<td  width="7%">���ܼƻ�</td>
	<td  width="7%">�������</td>
	<td  width="7%">����Ԥ��</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="6%">¼����</td>
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