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
	String gysddph=request.getParameter("gysddph");
	if (gysddph!=null)
	{
		gysddph=cf.GB2Uni(gysddph);
		if (!(gysddph.equals("")))	wheresql+=" and  (jxc_gysddmx.gysddph='"+gysddph+"')";
	}
	ls_sql="SELECT jxc_gysddmx.clbm clbm,nbbm,jxc_clbm.clmc,clxlbm,jxc_clbm.xh,jxc_clbm.gg,jxc_cljgb.zcpzsl,jxc_cljgb.zcpzsl-jxc_cljgb.dhsl kykc,jxc_gysddmx.dhsl ";
	ls_sql+=" FROM jxc_gysddmx,jxc_gysdd,jxc_cljgb,jxc_clbm  ";
	ls_sql+=" where jxc_gysddmx.gysddph=jxc_gysdd.gysddph and jxc_gysdd.dqbm=jxc_cljgb.dqbm and jxc_gysddmx.clbm=jxc_cljgb.clbm and jxc_gysddmx.clbm=jxc_clbm.clbm ";
    ls_sql+=wheresql;
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"clbm","dqbm","gys","lsj","xsj","cxhdbl","myqjf","sfycx","cxkssj","cxjzsj","cxj","lscxhdbl","cxmyqjf","sfykc","zcpzsl","dhsl","ycgsl"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"��ӡѡ�в���"};//��ť����ʾ����
	String[] buttonLink={"printgysdddy.jsp?gysddph="+gysddph+"&"};//��ť�������õ���ҳ���������Ӳ���
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
//	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
//	{
//		String[] sql=new String[1];//Ҫִ�е�SQL
//		boolean needCommit=false;//����Ҫ������
//		sql[0]="delete from jxc_cljgb where zcpzsl=0 and dhsl=0 and ycgsl=0 and "+chooseitem;
//		out.print(sql[0]);
//		pageObj.execDelete(sql,needCommit);
//	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�빴ѡ���ӡ�Ĳ�Ʒ</font></B><br>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">���ϱ���</td>
	<td  width="3%">�ڲ�����</td>
	<td  width="3%">��������</td>
	<td  width="3%">����С��</td>
	<td  width="3%">�ͺ�</td>
	<td  width="3%">���</td>
	<td  width="3%">�������</td>
	<td  width="3%">���ÿ��</td>
	<td  width="3%">��������</td>
	
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