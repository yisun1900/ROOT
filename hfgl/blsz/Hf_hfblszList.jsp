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
	String hf_hfblsz_ssfgs=null;
	String hf_hfblsz_hflx=null;
	String hf_hfblsz_khsksd=null;
	String hf_hfblsz_khsjzd=null;
	String hf_hfblsz_hfbl=null;
	hf_hfblsz_ssfgs=request.getParameter("hf_hfblsz_ssfgs");
	if (hf_hfblsz_ssfgs!=null)
	{
		hf_hfblsz_ssfgs=cf.GB2Uni(hf_hfblsz_ssfgs);
		if (!(hf_hfblsz_ssfgs.equals("")))	wheresql+=" and  (hf_hfblsz.ssfgs='"+hf_hfblsz_ssfgs+"')";
	}
	hf_hfblsz_hflx=request.getParameter("hf_hfblsz_hflx");
	if (hf_hfblsz_hflx!=null)
	{
		hf_hfblsz_hflx=cf.GB2Uni(hf_hfblsz_hflx);
		if (!(hf_hfblsz_hflx.equals("")))	wheresql+=" and  (hf_hfblsz.hflx='"+hf_hfblsz_hflx+"')";
	}
	hf_hfblsz_khsksd=request.getParameter("hf_hfblsz_khsksd");
	if (hf_hfblsz_khsksd!=null)
	{
		hf_hfblsz_khsksd=hf_hfblsz_khsksd.trim();
		if (!(hf_hfblsz_khsksd.equals("")))	wheresql+=" and (hf_hfblsz.khsksd="+hf_hfblsz_khsksd+") ";
	}
	hf_hfblsz_khsjzd=request.getParameter("hf_hfblsz_khsjzd");
	if (hf_hfblsz_khsjzd!=null)
	{
		hf_hfblsz_khsjzd=hf_hfblsz_khsjzd.trim();
		if (!(hf_hfblsz_khsjzd.equals("")))	wheresql+=" and (hf_hfblsz.khsjzd="+hf_hfblsz_khsjzd+") ";
	}
	hf_hfblsz_hfbl=request.getParameter("hf_hfblsz_hfbl");
	if (hf_hfblsz_hfbl!=null)
	{
		hf_hfblsz_hfbl=hf_hfblsz_hfbl.trim();
		if (!(hf_hfblsz_hfbl.equals("")))	wheresql+=" and  (hf_hfblsz.hfbl="+hf_hfblsz_hfbl+") ";
	}
	ls_sql="SELECT hf_hfblsz.ssfgs,sq_dwxx.dwmc,hf_hfblsz.hflx,DECODE(hf_hfblsz.hflx,'1','�ɵ��ط�','2','��ʩ���ط�','3','�깤�ط�') hflxmc,hf_hfblsz.khsksd,hf_hfblsz.khsjzd,hf_hfblsz.hfbl  ";
	ls_sql+=" FROM sq_dwxx,hf_hfblsz  ";
    ls_sql+=" where hf_hfblsz.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hf_hfblsz.ssfgs,hf_hfblsz.hflx,hf_hfblsz.khsksd";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hf_hfblszList.jsp","","","EditHf_hfblsz.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"dwmc","hflxmc","khsksd","khsjzd","hfbl"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"ssfgs","hflx","khsksd"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Hf_hfblszList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("hflxmc","1");//�в����������Hash��
	spanColHash.put("khsksd","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from hf_hfblsz where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="14%">�ֹ�˾</td>
	<td  width="14%">�ط�����</td>
	<td  width="14%">�ͻ�����ʼ��</td>
	<td  width="14%">�ͻ���������</td>
	<td  width="14%">�طñ���</td>
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