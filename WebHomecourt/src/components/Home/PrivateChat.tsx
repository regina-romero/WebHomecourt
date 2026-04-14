import type { FriendChat } from "./ListChats"
import ChatPanelFrame from "./ChatPanelFrame.tsx"

type PrivateChatProps = {
    selectedChat: FriendChat
    onBack: () => void
    onOpenCommunity?: () => void
}

function PrivateChat({ selectedChat, onBack, onOpenCommunity }: PrivateChatProps) {
    return (
        <ChatPanelFrame
            title="Private Chat"
            activeTab="private"
            onOpenCommunity={onOpenCommunity}
        >
            <div className="flex flex-col gap-4">
                <button
                    type="button"
                    onClick={onBack}
                    className="self-start text-purple-900 text-lg font-normal font-['Graphik'] hover:underline"
                >
                    Back to private chats
                </button>

                <div className="self-stretch inline-flex justify-start items-center gap-5">
                    <div className="w-16 h-16 p-0.5 rounded-full outline outline-2 outline-offset-[-2px] outline-gray-200 inline-flex flex-col justify-start items-start overflow-hidden bg-zinc-100">
                        <img
                            className="w-16 h-16 object-cover"
                            src={selectedChat.friend_photo ?? "https://placehold.co/64x64"}
                            alt={selectedChat.friend_nickname}
                        />
                    </div>
                    <div className="flex-1 text-purple-900 text-3xl font-normal font-['Graphik'] truncate">
                        {selectedChat.friend_nickname}
                    </div>
                </div>

                <div className="self-stretch h-0.5 bg-zinc-500"></div>

                <p className="text-zinc-700 text-base font-normal font-['Graphik']">
                    Last message: {selectedChat.last_message ?? "No messages yet"}
                </p>
                <p className="text-zinc-500 text-sm font-normal font-['Graphik']">
                    Private conversation view ready. Here you can render the full message thread and input.
                </p>
            </div>
        </ChatPanelFrame>
    )
}

export default PrivateChat