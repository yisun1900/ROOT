<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String jzph=request.getParameter("jzph");


	ls_sql="SELECT b.dwmc fgs,a.dwmc bm,DECODE(rs_yhxxqmjz.sfzszg,'M','<font color=\"#009999\">ʵϰ��</font>','Y','ת��','N','<font color=\"#0000CC\">������</font>','D','<font color=\"#CCCC00\">����</font>','S','<font color=\"#CC0000\">��ְ</font>','T','<font color=\"#CC00CC\">����</font>'),rs_yhxxqmjz.bianhao,rs_yhxxqmjz.yhmc,xzzwbm,rs_yhxxqmjz.ygbh,dm_zwbm.zwmc,c.dwmc jzbm, DECODE(rs_yhxxqmjz.yhjs,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','�ֹ�˾����','F3','�����','G0','��Ӧ��','J0','������'),rs_yhxxqmjz.sjsbh, DECODE(rs_yhxxqmjz.gzlb,'1','�̶�','2','��������'),kqhm, DECODE(rs_yhxxqmjz.kdlxtbz,'Y','��','N','��'), DECODE(rs_yhxxqmjz.xb,'M','��','W','Ů'),rs_yhxxqmjz.csrq, DECODE(rs_yhxxqmjz.hf,'Y','��','N','��'),rs_yhxxqmjz.mz,'`'||rs_yhxxqmjz.sfzh,rs_yhxxqmjz.hjszd,rs_yhxxqmjz.dacfd,rs_yhxxqmjz.byyx,rs_yhxxqmjz.zy,dm_xlbm.xueli,DECODE(rs_yhxxqmjz.dhsfgb,'1','����˾��','2','��������','9','������'),rs_yhxxqmjz.dh,rs_yhxxqmjz.bgdh,rs_yhxxqmjz.jtdh,rs_yhxxqmjz.email,rs_yhxxqmjz.zz,rs_yhxxqmjz.cjgzsj,ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj,rs_yhxxqmjz.rzsj,rs_yhxxqmjz.htksrq,rs_yhxxqmjz.htdqrq,rs_yhxxqmjz.lzrq, DECODE(rs_yhxxqmjz.sfqs,'Y','��','N','��'), DECODE(rs_yhxxqmjz.ylbx,'Y','��','N','��'), DECODE(rs_yhxxqmjz.jylbx,'Y','��','N','��'), DECODE(rs_yhxxqmjz.sybx,'Y','��','N','��'), DECODE(rs_yhxxqmjz.gsby,'Y','��','N','��'), DECODE(rs_yhxxqmjz.syx,'Y','��','N','��') ,rs_yhxxqmjz.shbxh,rs_yhxxqmjz.jbxdd,rs_yhxxqmjz.jjlxr,rs_yhxxqmjz.lxrdh,rs_yhxxqmjz.zkl, DECODE(rs_yhxxqmjz.ckjgbz,'Y','�ɿ�','N','����'), DECODE(rs_yhxxqmjz.zdyhbz,'Y','��','N','��'), rs_yhxxqmjz.bjjb,rs_yhxxqmjz.glgz,rs_yhxxqmjz.gwgz,rs_yhxxqmjz.jbgz,rs_sjsjb.sjsjbmc,rs_yhxxqmjz.yjsxe,rs_yhxxqmjz.jtbt,rs_yhxxqmjz.cb,rs_yhxxqmjz.dhbt, DECODE(rs_yhxxqmjz.sfydbs,'Y','��','N','��'), DECODE(rs_yhxxqmjz.sfytj,'Y','��','N','��'),rs_yhxxqmjz.tjrq,rs_yhxxqmjz.qgzdw,rs_yhxxqmjz.lrsj,rs_yhxxqmjz.bz ";
	ls_sql+=" FROM dm_xlbm,dm_zwbm,rs_sjsjb,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_yhxxqmjz  ";
    ls_sql+=" where rs_yhxxqmjz.sjsjb=rs_sjsjb.sjsjb(+) and rs_yhxxqmjz.zwbm=dm_zwbm.zwbm(+) and rs_yhxxqmjz.xlbm=dm_xlbm.xlbm(+)";
    ls_sql+=" and rs_yhxxqmjz.dwbh=a.dwbh(+) and rs_yhxxqmjz.ssfgs=b.dwbh(+) and rs_yhxxqmjz.jzbm=c.dwbh(+)";
    ls_sql+=" and rs_yhxxqmjz.jzph='"+jzph+"' ";
    ls_sql+=" order by rs_yhxxqmjz.ssfgs,rs_yhxxqmjz.dwbh,rs_yhxxqmjz.yhmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(20000);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yhmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ�������ת���ţ�<%=jzph%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(720);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="120">�ֹ�˾</td>
	<td  width="180">��������</td>
	<td  width="70">Ա��״̬</td>
	<td  width="70">����</td>
	<td  width="90">Ա������</td>
	<td  width="120">����ְ��</td>
	<td  width="70">���</td>
	<td  width="120">����</td>
	<td  width="140">��ְ����</td>
	<td  width="140">�û���ɫ</td>
	<td  width="140">���������</td>
	<td  width="70">�������</td>
	<td  width="70">���ں���</td>
	<td  width="70">�ɵ�½ϵͳ</td>
	<td  width="70">�Ա�</td>
	<td  width="90">��������</td>
	<td  width="70">���</td>
	<td  width="70">����</td>
	<td  width="140">���֤��</td>
	<td  width="180">�������ڵ�</td>
	<td  width="180">������ŵ�</td>
	<td  width="210">��ҵԺУ</td>
	<td  width="140">רҵ</td>
	<td  width="140">ѧ��</td>
	<td  width="90">�绰�Ƿ񹫲�</td>
	<td  width="140">�ֻ�</td>
	<td  width="140">�칫�绰</td>
	<td  width="140">��ͥ�绰</td>
	<td  width="140">email</td>
	<td  width="290">סַ</td>
	<td  width="90">��ҵʱ��</td>
	<td  width="70">����</td>
	<td  width="90">��ְ����</td>
	<td  width="90">��ͬ��ʼ����</td>
	<td  width="90">��ͬ��������</td>
	<td  width="90">��ְ����</td>
	<td  width="70">��������ϵ</td>
	<td  width="70">ҽ�Ʊ���</td>
	<td  width="70">���ϱ���</td>
	<td  width="70">ʧҵ����</td>
	<td  width="70">���˱���</td>
	<td  width="70">��������</td>
	<td  width="140">��ᱣ�պ�</td>
	<td  width="140">�ɱ��յص�</td>
	<td  width="140">������ϵ��</td>
	<td  width="140">����ϵ���ֻ�</td>
	<td  width="70">�����ۿ���</td>
	<td  width="70">����鿴�۸�</td>
	<td  width="70">�ص��û���־</td>
	<td  width="160">���ۼ���</td>
	<td  width="70">���乤��</td>
	<td  width="70">��λ����</td>
	<td  width="70">��������</td>
	<td  width="140">���ʦְ��</td>
	<td  width="70">���ɻ���</td>
	<td  width="70">��ͨ����</td>
	<td  width="70">ÿ�ղͲ�</td>
	<td  width="70">�ֻ�����</td>
	<td  width="70">�Ƿ��е�����</td>
	<td  width="70">�Ƿ������</td>
	<td  width="140">�������</td>
	<td  width="140">ǰ������λ</td>
	<td  width="90">¼��ʱ��</td>
	<td  width="640">��ע</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>