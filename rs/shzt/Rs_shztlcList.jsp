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
	String rs_shztlc_ztbm=null;
	String rs_shztlc_shjl=null;
	String rs_shztlc_xyztbm=null;

	String ztlx=null;
	ztlx=request.getParameter("ztlx");
	if (ztlx!=null)
	{
		ztlx=cf.GB2Uni(ztlx);
		if (!(ztlx.equals("")))	wheresql+=" and  (a.ztlx='"+ztlx+"')";
	}
	
	rs_shztlc_ztbm=request.getParameter("rs_shztlc_ztbm");
	if (rs_shztlc_ztbm!=null)
	{
		rs_shztlc_ztbm=cf.GB2Uni(rs_shztlc_ztbm);
		if (!(rs_shztlc_ztbm.equals("")))	wheresql+=" and  (rs_shztlc.ztbm='"+rs_shztlc_ztbm+"')";
	}
	rs_shztlc_shjl=request.getParameter("rs_shztlc_shjl");
	if (rs_shztlc_shjl!=null)
	{
		rs_shztlc_shjl=cf.GB2Uni(rs_shztlc_shjl);
		if (!(rs_shztlc_shjl.equals("")))	wheresql+=" and  (rs_shztlc.shjl='"+rs_shztlc_shjl+"')";
	}
	rs_shztlc_xyztbm=request.getParameter("rs_shztlc_xyztbm");
	if (rs_shztlc_xyztbm!=null)
	{
		rs_shztlc_xyztbm=cf.GB2Uni(rs_shztlc_xyztbm);
		if (!(rs_shztlc_xyztbm.equals("")))	wheresql+=" and  (rs_shztlc.xyztbm='"+rs_shztlc_xyztbm+"')";
	}
	ls_sql="SELECT rs_shztlc.ztbm,a.ztmc ztbmmc, DECODE(a.ztlx,'01','��Ƹ','02','��ѵ','03','�䶯','04','��������','06','������ְ','07','��������','08','�Ӱ�����','09','���ڿ�������','10','��ٵ�','11','��������','12','�����λ����','13','��ְ����','14','�˻���Ա����') ztlxmc, DECODE(a.sqzt,'02','��������','03','����ͨ��','04','����ȡ��') sqztmc,rs_shztlc.shjl,rs_shjlbm.shjlmc,b.ztmc xyztbm  ";
	ls_sql+=" FROM rs_shjlbm,rs_shztlc,rs_ztbm a,rs_ztbm b ";
    ls_sql+=" where rs_shztlc.ztbm=a.ztbm(+) and rs_shztlc.xyztbm=b.ztbm(+) and rs_shztlc.shjl=rs_shjlbm.shjl(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by a.ztlx,rs_shztlc.ztbm,rs_shztlc.shjl";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Rs_shztlcList.jsp","SelectRs_shztlc.jsp","","EditRs_shztlc.jsp");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"ztbmmc","shjlmc","xyztbm","sqztmc","ztlxmc"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"ztbm","shjl"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_shztlcList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ztbmmc","1");//�в����������Hash��
	spanColHash.put("ztlxmc","2");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from rs_shztlc where "+chooseitem;
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
	<td  width="24%">���״̬</td>
	<td  width="12%">��˽���</td>
	<td  width="24%">��һ״̬</td>
	<td  width="14%">���޸�����״̬</td>
	<td  width="18%">״̬����</td>
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