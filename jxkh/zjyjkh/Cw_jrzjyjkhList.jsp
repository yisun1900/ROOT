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
	String cw_jrzjyjkh_khzq=null;
	String cw_jrzjyjkh_fgsbh=null;
	String cw_jrzjyjkh_dwbh=null;
	String cw_jrzjyjkh_yhmc=null;
	cw_jrzjyjkh_khzq=request.getParameter("cw_jrzjyjkh_khzq");
	if (cw_jrzjyjkh_khzq!=null)
	{
		cw_jrzjyjkh_khzq=cf.GB2Uni(cw_jrzjyjkh_khzq);
		if (!(cw_jrzjyjkh_khzq.equals("")))	wheresql+=" and  (cw_jrzjyjkh.khzq='"+cw_jrzjyjkh_khzq+"')";
	}
	cw_jrzjyjkh_fgsbh=request.getParameter("cw_jrzjyjkh_fgsbh");
	if (cw_jrzjyjkh_fgsbh!=null)
	{
		cw_jrzjyjkh_fgsbh=cf.GB2Uni(cw_jrzjyjkh_fgsbh);
		if (!(cw_jrzjyjkh_fgsbh.equals("")))	wheresql+=" and  (cw_jrzjyjkh.fgsbh='"+cw_jrzjyjkh_fgsbh+"')";
	}
	cw_jrzjyjkh_dwbh=request.getParameter("cw_jrzjyjkh_dwbh");
	if (cw_jrzjyjkh_dwbh!=null)
	{
		cw_jrzjyjkh_dwbh=cf.GB2Uni(cw_jrzjyjkh_dwbh);
		if (!(cw_jrzjyjkh_dwbh.equals("")))	wheresql+=" and  (cw_jrzjyjkh.dwbh='"+cw_jrzjyjkh_dwbh+"')";
	}
	cw_jrzjyjkh_yhmc=request.getParameter("cw_jrzjyjkh_yhmc");
	if (cw_jrzjyjkh_yhmc!=null)
	{
		cw_jrzjyjkh_yhmc=cf.GB2Uni(cw_jrzjyjkh_yhmc);
		if (!(cw_jrzjyjkh_yhmc.equals("")))	wheresql+=" and  (cw_jrzjyjkh.yhmc='"+cw_jrzjyjkh_yhmc+"')";
	}
	ls_sql="SELECT cw_jrzjyjkh.khzq,cw_jrzjyjkh.khqssj,cw_jrzjyjkh.khjzsj,a.dwmc fgsbh,cw_jrzjyjkh.dwbh,b.dwmc,cw_jrzjyjkh.yhmc,cw_jrzjyjkh.khfs,cw_jrzjyjkh.lrr,cw_jrzjyjkh.lrsj,cw_jrzjyjkh.bz  ";
	ls_sql+=" FROM cw_jrzjyjkh,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where cw_jrzjyjkh.fgsbh=a.dwbh(+)";
    ls_sql+=" and cw_jrzjyjkh.dwbh=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrzjyjkh.khzq,cw_jrzjyjkh.fgsbh,cw_jrzjyjkh.dwbh,cw_jrzjyjkh.yhmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jrzjyjkhList.jsp","","","EditCw_jrzjyjkh.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khzq","cw_jrzjyjkh_khqssj","cw_jrzjyjkh_khjzsj","cw_jrzjyjkh_fgsbh","dwbh","sq_dwxx_dwmc","yhmc","cw_jrzjyjkh_khfs","cw_jrzjyjkh_lrr","cw_jrzjyjkh_lrsj","cw_jrzjyjkh_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khzq","dwbh","yhmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_jrzjyjkhList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_jrzjyjkh where "+chooseitem;
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
	<td  width="6%">&nbsp;</td>
	<td  width="8%">��������</td>
	<td  width="8%">������ʼʱ��</td>
	<td  width="8%">���˽���ʱ��</td>
	<td  width="10%">�ֹ�˾</td>
	<td  width="8%">��������</td>
	<td  width="9%">��������</td>
	<td  width="6%">����</td>
	<td  width="8%">���˷���</td>
	<td  width="6%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="58%">��ע</td>
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