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
	String cw_dmkhcz_nian=null;
	String cw_dmkhcz_yue=null;
	String cw_dmkhcz_lrr=null;
	String cw_dmkhcz_lrsj=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_dwxx.ssfgs='"+ssfgs+"')";
	}

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_dmkhcz.dwbh='"+dwbh+"')";
	}
	
	cw_dmkhcz_nian=request.getParameter("cw_dmkhcz_nian");
	if (cw_dmkhcz_nian!=null)
	{
		cw_dmkhcz_nian=cf.GB2Uni(cw_dmkhcz_nian);
		if (!(cw_dmkhcz_nian.equals("")))	wheresql+=" and  (cw_dmkhcz.nian='"+cw_dmkhcz_nian+"')";
	}
	cw_dmkhcz_yue=request.getParameter("cw_dmkhcz_yue");
	if (cw_dmkhcz_yue!=null)
	{
		cw_dmkhcz_yue=cf.GB2Uni(cw_dmkhcz_yue);
		if (!(cw_dmkhcz_yue.equals("")))	wheresql+=" and  (cw_dmkhcz.yue='"+cw_dmkhcz_yue+"')";
	}
	cw_dmkhcz_lrr=request.getParameter("cw_dmkhcz_lrr");
	if (cw_dmkhcz_lrr!=null)
	{
		cw_dmkhcz_lrr=cf.GB2Uni(cw_dmkhcz_lrr);
		if (!(cw_dmkhcz_lrr.equals("")))	wheresql+=" and  (cw_dmkhcz.lrr='"+cw_dmkhcz_lrr+"')";
	}
	cw_dmkhcz_lrsj=request.getParameter("cw_dmkhcz_lrsj");
	if (cw_dmkhcz_lrsj!=null)
	{
		cw_dmkhcz_lrsj=cw_dmkhcz_lrsj.trim();
		if (!(cw_dmkhcz_lrsj.equals("")))	wheresql+="  and (cw_dmkhcz.lrsj>=TO_DATE('"+cw_dmkhcz_lrsj+"','YYYY/MM/DD'))";
	}
	cw_dmkhcz_lrsj=request.getParameter("cw_dmkhcz_lrsj2");
	if (cw_dmkhcz_lrsj!=null)
	{
		cw_dmkhcz_lrsj=cw_dmkhcz_lrsj.trim();
		if (!(cw_dmkhcz_lrsj.equals("")))	wheresql+="  and (cw_dmkhcz.lrsj<=TO_DATE('"+cw_dmkhcz_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_dmkhcz.dwbh,sq_dwxx.dwmc,dm_dwjb.dwjbmc,dm_dmxs.dmxsmc,dm_ssfw.ssfwmc,sq_dwxx.dwdz,sq_dwxx.dwfzr,sq_dwxx.dwdh,cw_dmkhcz.nian,cw_dmkhcz.yue,cw_dmkhcz.khcz,cw_dmkhcz.mbcz,cw_dmkhcz.lrr,cw_dmkhcz.lrsj  ";
	ls_sql+=" FROM dm_ssfw,dm_dmxs,dm_dwjb,sq_dwxx,cw_dmkhcz  ";
    ls_sql+=" where sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and cw_dmkhcz.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_dmkhcz.dwbh,cw_dmkhcz.nian desc,cw_dmkhcz.yue";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_dmkhczList.jsp","SelectCw_dmkhcz.jsp","","EditCw_dmkhcz.jsp");
	pageObj.setPageRow(15);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"nian","yue","khcz","mbcz","lrr","lrsj","dwmc","dwjbmc","dmxsmc"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"dwbh","nian","yue"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_dmkhczList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("nian","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("dwjbmc","1");//�в����������Hash��
	spanColHash.put("dmxsmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dwbh","nian","yue"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_dmkhjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yue",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_dmkhcz where "+chooseitem;
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
	<td  width="8%">��</td>
	<td  width="7%">��</td>
	<td  width="12%">���˲�ֵ</td>
	<td  width="12%">Ŀ���ֵ</td>
	<td  width="8%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="17%">��λ����</td>
	<td  width="10%">��λ����</td>
	<td  width="10%">������ʽ</td>
</tr>
<%
	pageObj.printDateSum();
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